" vimwiki configs

" let g:vimwiki_folding = 'syntax'
let g:vimwiki_markdown_link_ext = 1

let home = {}
let home.name = 'home'
let home.path = $HW
let home.syntax = 'markdown'
let home.ext = '.md'
let home.diary_rel_path = 'log'
let home.diary_index = 'log'
let home.diary_header = 'Log'

let site = {}
let site.name = 'site'
let site.path = '~/side/site/sitewiki/'
let site.path_html = '~/side/site/'
let site.syntax = 'markdown'
let site.ext = '.md'
let site.css_name = 'static/style.css'
let site.auto_export = 0
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
hi VimwikiItalic ctermfg=219
hi VimwikiBold ctermfg=228
hi VimwikiCode ctermfg=86

hi VimwikiHeader1 ctermfg=81
hi VimwikiHeader2 ctermfg=204
hi VimwikiHeader3 ctermfg=42
hi VimwikiHeader4 ctermfg=178
hi VimwikiHeader5 ctermfg=99
hi VimwikiHeader6 ctermfg=37
