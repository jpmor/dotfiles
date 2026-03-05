" mappings
noremap <SPACE> <Nop>
let mapleader = ' '

" toggles
nmap <silent> <leader>/ :set invhls<CR>
nmap <silent> <leader>x :set invnu<CR>
nmap <silent> <leader>s :set invspell<CR>
nmap <silent> <leader>\ :set invrightleft<CR>

" open dotfiles
nmap <silent> <leader>a :e $DOT/zsh/aliases.zsh<CR>
nmap <silent> <leader>m :e $DOT/vim/vim/maps.vim<CR>
nmap <silent> <leader>r :so $DOT/vim/vimrc<CR>
nmap <silent> <leader>v :e $DOT/vim/vimrc<CR>
nmap <silent> <leader>z :e $DOT/zsh/zshenv<CR>

" plugins
nmap <silent> <leader>A :ALEToggle<CR>
nmap <silent> <leader>B :Git blame<CR>
nmap <silent> <leader>f :call RG2("<C-R><C-W>")<CR>

" navigation
nmap , %
nmap <silent> <leader>, :bprevious<CR>
nmap <silent> <leader>. :bnext<CR>
nmap <silent> <leader>h <C-W><C-H>
nmap <silent> <leader>j <C-W><C-J>
nmap <silent> <leader>k <C-W><C-K>
nmap <silent> <leader>l <C-W><C-L>

" git
nmap <silent> <leader>gf :call Line()<CR>
nmap <silent> <leader>gh :call Blame()<CR>

" util
nmap <silent> <leader>p :let @+ = join([expand('%'),  line(".")], ':')<CR>
