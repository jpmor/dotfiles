set nocompatible

" vundle
set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent off
    call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
        Plugin 'dag/vim-fish'
        Plugin 'dracula/vim'
        Plugin 'fatih/vim-go'
        Plugin 'rust-lang/rust.vim'
        Plugin 'scrooloose/nerdtree'
        Plugin 'vimwiki/vimwiki'
    call vundle#end()
filetype plugin indent on

" general
set ts=8 et shiftwidth=4 sts=4
set bs=indent,eol,start
set sh=/bin/bash
set enc=utf-8

" folds
set fdm=syntax
set foldlevel=99

augroup AutoSaveFolds
      autocmd!
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent loadview
augroup END

" windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" colors
syntax on
set hls
set is
colors dracula

hi Search ctermfg=46
hi IncSearch ctermfg=46 ctermbg=0 cterm=underline
hi Visual ctermbg=236

" vimwiki
let mapleader = ' '
let g:vimwiki_folding='syntax'

let home = {}
let home.path = '~/homewiki/'
let home.auto_tags = 0

let site = {}
let site.path = '~/side/site/sitewiki/' 
let site.path_html = '~/side/site/'
let site.template_path = '~/side/site/'
let site.template_default = 'template'
let site.template_ext = ''

let g:vimwiki_list = [home, site]
 
hi VimwikiTag ctermfg=9
hi VimwikiLink ctermfg=3
hi VimwikiList ctermfg=48
hi VimwikiHeader1 ctermfg=14
hi VimwikiHeader2 ctermfg=9
hi VimwikiHeader3 ctermfg=6
hi VimwikiHeader4 ctermfg=3
hi VimwikiHeader5 ctermfg=10
hi VimwikiHeaderChar ctermfg=4 

nmap \e :NERDTreeToggle<CR>
" You don't know what you're missing if you don't use this.
nmap <C-e> :e#<CR>

" Move between open buffers.
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
