set nocompatible

" vundle
set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent off
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'dracula/vim'
    " Plugin 'w0rp/ale'
    Plugin 'fatih/vim-go'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vimwiki/vimwiki'
  call vundle#end()
filetype plugin indent on

" general
set ts=2 et shiftwidth=2 sts=2
set bs=indent,eol,start
set sh=/bin/bash
set enc=utf-8
set nofoldenable

" views 
augroup AutoSaveViews
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
syntax enable
set hls
set is
colors dracula

hi Search ctermfg=46 ctermbg=0 cterm=underline
hi IncSearch ctermfg=46 ctermbg=0 cterm=underline
hi Visual ctermbg=236

" vimwiki
so $HOME/.vim/wiki.conf.vim

" movement
nmap <LEADER>d :NERDTreeToggle<CR>
nmap <LEADER>n :noh<CR>
nmap <LEADER>x :set invnumber<CR>
nmap <LEADER>e :e#<CR>
nmap <LEADER>j :lprev<CR>
nmap <LEADER>k :lnext<CR>
