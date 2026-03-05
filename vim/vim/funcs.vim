" vimscript functions
function RemoteHead()
  return '/' . system('git config --get init.defaultbranch | tr -d "\n"')
endfunction

function Line()
  let filepath = substitute(expand('%:p:f'), system('git rev-parse --show-toplevel | tr -d "\n"'), '', '')
  let origin = system('git config --local --get remote.origin.url | sed -n "s/.git$//p" | tr -d "\n"')
  let url = origin . '/blob' . RemoteHead() . filepath . '\#L' . line('.')
  call Browse(url)
endfunction

function Blame()
  let filepath = substitute(expand('%:p:f'), system('git rev-parse --show-toplevel | tr -d "\n"'), '', '')
  let filepath = substitute(filepath, '^/', '', '')
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
