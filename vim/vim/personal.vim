" personal mappings
nmap <silent> <leader>gq :call Quote()<CR>
nmap <silent> <leader>b V:s/\.[ ]*/.\r\r/g<CR>d2d
nmap <silent> <leader>n :.,$sort! ur /\[.*\]/<bar>.,$sort! ur /log\/\d\{4}-\d\{2}-\d\{2}/<CR>
nmap <silent> <leader>4 :call Browse("https://finviz.com/quote.ashx?t=<cword>")<CR>
map  <silent> <leader>w y:call Browse("https://en.wikipedia.org/wiki/<C-r>"")<CR>

" Copies the current line without tags as a markdown link into the primary register.
function Quote()
  let line = getline('.')
  let line = ' "' . substitute(line, '"', '\\"', 'g') . '"'
  let entry = ' "' . expand('%') . '"'
  let @* = system('$HW/tools/flow -q ' . line . entry)
endfunction

" vimwiki configs
" let g:vimwiki_folding = 'syntax'
let g:vimwiki_markdown_link_ext = 1

let home = {}
let home.name = 'home'
let home.path = $HW . '/'
let home.index = 'wiki/index'
let home.syntax = 'markdown'
let home.ext = '.md'
let home.diary_rel_path = 'log/'
let home.diary_index = 'log'
let home.diary_header = 'Log'

let site = {}
let site.name = 'site'
let site.path = '~/side/site/sitewiki/'
let site.path_html = '~/side/site/'
let site.syntax = 'markdown'
let site.ext = '.md'
let site.css_name = 'static/style.css'
let site.template_path = '~/side/site/static/'
let site.template_default = 'template'
let site.template_ext = ''

let g:vimwiki_list = [home, site]

" https://ss64.com/bash/syntax-colors.html
hi VimwikiCellSeparator ctermfg=25
hi VimwikiHeaderChar ctermfg=25
hi VimwikiTag ctermfg=191
hi VimwikiTag ctermfg=24
hi VimwikiLink ctermfg=172
hi VimwikiList ctermfg=30
hi VimwikiItalic ctermfg=228 cterm=italic
hi VimwikiBold ctermfg=219 cterm=bold
hi VimwikiCode ctermfg=86

hi VimwikiHeader1 ctermfg=81
hi VimwikiHeader2 ctermfg=204
hi VimwikiHeader3 ctermfg=42
hi VimwikiHeader4 ctermfg=178
hi VimwikiHeader5 ctermfg=99
hi VimwikiHeader6 ctermfg=37
