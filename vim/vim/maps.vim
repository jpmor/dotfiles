" mappings
let mapleader = ' '


" inv toggles
nmap <silent> <leader>/ :set invhls<CR>
nmap <silent> <leader>x :set invnu<CR>
nmap <silent> <leader>s :set invspell<CR>
nmap <silent> <leader>\ :set invrightleft<CR>
"nmap <silent> <leader>r :reg<CR>

" configs
nmap <silent> <leader>r :so ~/.vimrc<CR>
nmap <silent> <leader>v :e ~/.vimrc<CR>
nmap <silent> <leader>m :e ~/.vim/maps.vim<CR>
nmap <silent> <leader>z :e ~/.zshenv<CR>
nmap <silent> <leader>a :e ~/.dot/zsh/aliases.zsh<CR>

" plugins
nmap <silent> <leader>A :ALEToggle<CR>
nmap <silent> <leader>f :GFiles<CR>
nmap <silent> <leader>d :NERDTreeToggle<CR>
nmap <silent> <leader>D :NERDTreeFind<CR>
nmap <silent> <leader>B :Gblame<CR>

"nmap <silent> <leader>b :e#<CR>
nmap , %
nmap <silent> <leader>, :bprevious<cr>
nmap <silent> <leader>. :bnext<cr>
nmap <silent> <leader>j :lprev<CR>
nmap <silent> <leader>k :lnext<CR>
nmap <silent> <leader>h <C-W><C-H>
nmap <silent> <leader>j <C-W><C-J>
nmap <silent> <leader>k <C-W><C-K>
nmap <silent> <leader>l <C-W><C-L>

" other
nmap <silent> <leader>p :let @+ = join([expand('%'),  line(".")], ':')<CR>
nmap <silent> <leader>b V:s/\.[ ]*/.\r\r/g<CR>d2d

nmap <silent> <leader>gf :call Line()<CR>
nmap <silent> <leader>gh :call Blame()<CR>
nmap <silent> <leader>4 :call Browse("https://finviz.com/quote.ashx?t=<cword>")<CR>
