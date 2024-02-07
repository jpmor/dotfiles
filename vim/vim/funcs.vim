" vimscript functions
function RemoteHead()
  return '/' . system('git config --get init.defaultbranch | tr -d "\n"')
endfunction

function Line()
  let filepath = substitute(expand('%:p:f'), system('git rev-parse --show-toplevel | tr -d "\n"'), '', '')
  "strip dirs preceding org dir
  let filepath = substitute(filepath, $MC, '', '')
  let filepath = substitute(filepath, $IMC, '', '')
  "format with github uri path
  let origin = system('git config --local --get remote.origin.url | sed -n "s/.git$//p" | tr -d "\n"')
  "let url = substitute(filepath, '/[a-z\-0-9]*/[a-z\-0-9]*/', '\0tree/' . remote_head, '')
  "add line number and hostname
  let url = origin . '/blob' . RemoteHead() . filepath . '\#L' . line('.')
  call Browse(url)
endfunction

function Blame()
  let filepath = substitute(expand('%:p:f'), system('git rev-parse --show-toplevel | tr -d "\n"'), '', '')
  "strip dirs preceding org dir
  let filepath = substitute(filepath, $MC, '', '')
  let filepath = substitute(filepath, $IMC, '', '')
  "strip leading slash
  let filepath = substitute(filepath, '^/', '', '')
  "format with github uri path
  let origin = system('git config --local --get remote.origin.url | sed -n "s/.git$//p" | tr -d "\n"')
  let cmd = substitute("git blame -L LINE,LINE ", 'LINE', line('.'), 'g') . filepath . " | awk '{printf $1}'"
  let url = origin . '/commit/' . system(cmd)
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
