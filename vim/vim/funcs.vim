" vimscript functions

function GHE()
  let u = substitute(expand('%:p:f'), $MC, '', '')
  let u = substitute(u, '/[a-z\-]*/[a-z\-]*/', '\0tree/master/', '')
  let u = substitute(u . '\#L' . line('.'), '^', 'https://git.rsglab.com', '')
  call BROWSE(u)
endfunction

function BROWSE(url)
  exe 'silent !open ' . a:url
  redraw!
endfunction
