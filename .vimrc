set nocompatible

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

filetype plugin indent off
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'dracula/vim'
    Plugin 'fatih/vim-go'
    Plugin 'junegunn/fzf.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vimwiki/vimwiki'
    Plugin 'w0rp/ale'
  call vundle#end()
filetype plugin indent on

" general
set ts=2 et shiftwidth=2 sts=2
set bs=indent,eol,start
set sh=/bin/bash
set enc=utf-8
set nofoldenable
set clipboard=unnamed

" remove trailing spaces & save view
augroup AutoSaveViews
  autocmd!
  autocmd BufWritePre *.* %s/\s\+$//e
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview
augroup END

" windows
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

" colors
syntax enable
set hls
set is
"set cc=80
colors dracula
hi Search ctermfg=46 ctermbg=0 cterm=underline
hi IncSearch ctermfg=46 ctermbg=0 cterm=underline
hi Visual ctermbg=236
set display+=lastline

" dev
set tags=.git/tags

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_php_phpcs_standard='$MC/product/mailchimp/vendor/rsg/mc-codesniffer-ruleset/MCStandard --exclude=Generic.Files.LineLength,Squiz.WhiteSpace.SuperfluousWhitespace -d memory_limit=-1'

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

" vimwiki
so $HOME/.vim/wiki.conf.vim

" mappings
let mapleader = ' '
  nmap <silent> <leader>/ :noh<CR>
  nmap <silent> <leader>x :set invnumber<CR>
  nmap <silent> <leader>r :reg<CR>
  nmap <silent> , zz
  nmap <silent> <leader>v :e ~/.vimrc<CR>
  nmap <silent> <leader>z :e ~/.zshrc<CR>
  nmap <silent> <leader>s :so ~/.vimrc<CR>

  nmap <silent> <leader>f :GFiles<CR>
  nmap <silent> <leader>d :NERDTreeToggle<CR>
  nmap <silent> <leader>D :NERDTreeFind<CR>

  nmap <silent> <leader>b :e#<CR>
  nmap <silent> <leader>n :bprevious<cr>
  nmap <silent> <leader>m :bnext<cr>
  nmap <silent> <leader>j :lprev<CR>
  nmap <silent> <leader>k :lnext<CR>

  nmap <silent> <leader>g :call GHE()<CR>
  nmap <silent> <leader>$ :call BROWSE("https://finviz.com/quote.ashx?t=<cword>")<CR>
