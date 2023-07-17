" vimscript functions

function Line()
  " these lines check the prod branch name, but are slower
  let remote_head = system('git remote show origin | sed -n "s/  HEAD branch: \(\w\)/\1/p" | tr -d "\n"') . '/'
  "let remote_head = "main/"
  "strip gopath for mcgo repos
  let u = substitute(expand('%:p:f'), '/go/src/' . $GITHUB_HOST, '', '')
  "strip dirs preceding org dir
  let u = substitute(u, $MC, '', '')
  let u = substitute(u, $IMC, '', '')
  "format with github uri path
  let u = substitute(u, '/[a-z\-0-9]*/[a-z\-0-9]*/', '\0tree/' . remote_head, '')
  "add line number and hostname
  let host = system('cat ../../.host | tr -d "\n"')
  let u = substitute(u . '\#L' . line('.'), '^', 'https://' . host, '')
  call Browse(u)
endfunction

function Blame()
  let path = expand('%:p:f')
  let path = substitute(path, '/go/src/' . $GITHUB_HOST, '', '')
  let orgrepo = substitute(path, $MC . '\(/[a-z\-0-9]*/[a-z\-0-9]*/\).*', '\1', '')
  let cmd = substitute("git blame -L LINE,LINE ", 'LINE', line('.'), 'g') . path . " | awk '{printf $1}'"
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

" For use with vimwiki. Copies the current line _without_ tags
" as a markdown link into the primary register.
function Quote()
  let line = getline('.')
  let untagged_line = substitute(line, ' :[a-z:]*$', '', '')
  let relative_path = substitute(expand('%'), $HW . '/', '', '')
  let @* = '[' . untagged_line . '](' . relative_path . ')'
endfunction
