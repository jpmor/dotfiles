" vimscript functions

function Line()

  "let remote_head = system('git remote show upstream | sed -n "s/  HEAD branch: \(\w\)/\1/p"') . '/'
  "let remote_head = substitute(remote_head, '\n', '', '') " Strip the newline sed adds
  let remote_head = "main/"
  let u = substitute(expand('%:p:f'), '/go/src/' . $GITHUB_HOST, '', '')
  let u = substitute(u, $MC, '', '')
  let u = substitute(u, '/[a-z\-0-9]*/[a-z\-0-9]*/', '\0tree/' . remote_head, '')
  let u = substitute(u . '\#L' . line('.'), '^', 'https://' . $GITHUB_HOST, '')
  call Browse(u)
endfunction

function Blame()
  let path = expand('%:p:f')
  let path = substitute(path, '/go/src/' . $GITHUB_HOST, '', '')
  let orgrepo = substitute(path, $MC . '\(/[a-z\-0-9]*/[a-z\-0-9]*/\).*', '\1', '')
  let cmd = substitute("git blame -L LINE,LINE ", 'LINE', line('.'), 'g') . path . " | awk '{print $1}'"
  let url = "https://" . $GITHUB_HOST . orgrepo . "commit/" . system(cmd)
  call Browse(url)
endfunction

function Browse(url)
  exe 'silent !open "' . a:url . '"'
  redraw!
endfunction

function RG2(pattern)
  let a = "rg --line-number --no-heading --color=always --smart-case -g '!{"
  let b = system("if [ -d vendor ]; then print vendor/^rsg | sed 's/ /,/g' | tr -d '\n'; else print ''; fi")
  let c = "}/**' -- "
  call fzf#vim#grep(a.b.c. shellescape(a:pattern), 1, fzf#vim#with_preview(), 0)
endfunction
