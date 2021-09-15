" Needed for true colors in alacritty. (https://github.com/alacritty/alacritty/issues/109)
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
autocmd vimenter * ++nested colorscheme solarized8

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'lifepillar/vim-solarized8'
Plug 'LnL7/vim-nix'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" :CocInstall coc-rust-analyzer
" :CocInstall coc-python

autocmd BufRead,BufNewFile wscript setfiletype python
autocmd InsertEnter * set cul  " Highlight the current line in insert mode.
autocmd InsertLeave * set nocul
let &sbr = nr2char(8618).' '  " Show -> at the beginning of wrapped lines.
let g:autoformat_verbosemode=1
let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeMouseMode=3  " Single-click to open files.
let g:SimpylFold_fold_docstring = 0
let b:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
let b:SimpylFold_fold_import = 0
set background=dark
set colorcolumn=80,120
set encoding=utf-8
set guioptions=Ace
set hidden  " Allow switching buffers even if current buffer is dirty.
set hlsearch  " Highlight search results.
set ignorecase  " Ignore case in search.
set list  " Show whitespace (see listchars below).
set listchars=tab:>·,trail:~,extends:>,precedes:<  " , eol:¬
set mouse=a  " Enable mouse in all modes.
set nopaste  " Turn off paste mode.
set number relativenumber  " Show absolute current line number and relative line numbers.
set scrolloff=10  " Keep 10 lines visible around cursor.
set smartcase  " Ignore case if pattern does not include an uppercase letter.
set timeoutlen=1000 ttimeoutlen=0  " Timeout length for consecutive mappings and key codes, respectively.
set termguicolors
set ttymouse=sgr  " Needed for mouse to play well with tmux.
set signcolumn=yes  " Always show the sign column.
set shortmess+=c
set updatetime=300  " Length of time after typing stops to trigger plugin.
inoremap <silent><expr> <c-@> coc#refresh()  " Trigger code completion.
noremap <F5> :NERDTreeToggle<CR>
noremap <F6> :Buffers<CR>
noremap <F8> :Files<CR>
" Do not map F7.
noremap <F9> :Ag<CR>
noremap <C-a> :Autoformat<CR>
nnoremap <esc><esc> :noh<return>
nnoremap <space> za
vnoremap <space> zf

" Better MathJax in Markdown documents. (https://stsievert.com/blog/2016/01/06/vim-jekyll-mathjax/)
function! MathAndLiquid()
    syn region math start=/\$\$/ end=/\$\$/
    syn match math_block '\$[^$].\{-}\$'
    syn match liquid '{%.*%}'
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    syn region highlight_block start='```' end='```'
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

hi clear SignColumn  " Clear the sign column for gitgutter.

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap c :bp\|bd #<CR>

source ~/.coc.vimrc
