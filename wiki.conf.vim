" vimwiki
let mapleader = ' '
let g:vimwiki_folding='syntax'

let home = {}
let home.path = '~/homewiki/'
let home.auto_tags = 0

let mc = {}
let mc.path = '~/mc/rsg/mcwiki'
let mc.auto_tags = 0

let site = {}
let site.path = '~/side/site/sitewiki/' 
let site.path_html = '~/side/site/'
let site.template_path = '~/side/site/static/'
let site.template_default = 'template'
let site.template_ext = ''

let g:vimwiki_list = [home, site, mc]
 
hi VimwikiCellSeparator ctermfg=25
hi VimwikiHeaderChar ctermfg=25
hi VimwikiTag ctermfg=204
hi VimwikiLink ctermfg=214
hi VimwikiList ctermfg=30
hi VimwikiItalic ctermfg=173
hi VimwikiBold ctermfg=141
hi VimwikiHeader1 ctermfg=45
hi VimwikiHeader2 ctermfg=167
hi VimwikiHeader3 ctermfg=36
hi VimwikiHeader4 ctermfg=178
hi VimwikiHeader5 ctermfg=10
