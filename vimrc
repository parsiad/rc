" Needed for true colors in alacritty. (https://github.com/alacritty/alacritty/issues/109)
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
autocmd vimenter * ++nested colorscheme solarized8

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'arthurxavierx/vim-unicoder'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'Chiel92/vim-autoformat'
Plug 'fidian/hexmode'
Plug 'github/copilot.vim', {'branch': 'release'}
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'lifepillar/vim-solarized8'
Plug 'LnL7/vim-nix'
Plug 'mboughaba/i3config.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-sleuth'
Plug 't9md/vim-choosewin'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" :CocInstall coc-rust-analyzer
" :CocInstall coc-pyright
" :CocInstall coc-clangd

autocmd BufRead,BufNewFile wscript setfiletype python
autocmd InsertEnter * set cul  " Highlight the current line in insert mode.
autocmd InsertLeave * set nocul
let &sbr = nr2char(8618).' '  " Show -> at the beginning of wrapped lines.
let g:autoformat_verbosemode=1
let g:airline#extensions#tabline#enabled = 1
let g:choosewin_overlay_enable = 1
let g:copilot_no_tab_map = v:true
let g:hexmode_patterns = '*.bin,*.exe,*.o'
let g:NERDTreeMouseMode=3  " Single-click to open files.
let g:rust_fold = 1
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
set signcolumn=yes  " Always show the sign column.
set shortmess+=c
set updatetime=300  " Length of time after typing stops to trigger plugin.
inoremap <silent><expr> <C-space> coc#refresh()  " Trigger code completion.
inoremap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
noremap <F5> :NERDTreeToggle<CR>
noremap <F6> :TagbarToggle<CR>
" Do not map F7.
noremap <F9> :Ag<CR>
noremap <F10> :Buffers<CR>
noremap <F11> :Files<CR>
noremap <C-a> :Autoformat<CR>
noremap <C-w> :ChooseWin<CR>
noremap <C-x> :CocAction<CR>
nnoremap <esc><esc> :noh<return>
nnoremap <space> za
vnoremap <space> zf

if !has('nvim')
    set ttymouse=sgr  " Needed for mouse to play well with tmux.
endif

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
