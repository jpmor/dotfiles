" vimscript functions

function Line()
  let u = substitute(expand('%:p:f'), $MC, '', '')
  let u = substitute(u, '/[a-z\-]*/[a-z\-]*/', '\0tree/master/', '')
  let u = substitute(u . '\#L' . line('.'), '^', 'https://git.rsglab.com', '')
  call Browse(u)
endfunction

function Blame()
  let path = expand('%:p:f')
  let orgrepo = substitute(path, $MC . '\(/[a-z\-]*/[a-z\-]*/\).*', '\1', '')
  let cmd = substitute("git blame -L LINE,LINE ", 'LINE', line('.'), 'g') . path . " | awk '{print $1}'"
  let url = "https://git.rsglab.com" . orgrepo . "commit/" . system(cmd)
  call Browse(url)
endfunction

function Browse(url)
  exe 'silent !open ' . a:url
  redraw!
endfunction
