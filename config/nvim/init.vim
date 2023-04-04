" Needed for true colors in alacritty. (https://github.com/alacritty/alacritty/issues/109)
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
autocmd vimenter * ++nested colorscheme solarized8

call plug#begin()
Plug 'LnL7/vim-nix'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'arthurxavierx/vim-unicoder'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'fidian/hexmode'
Plug 'godlygeek/tabular'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'lifepillar/vim-solarized8'
Plug 'mboughaba/i3config.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'rcarriga/nvim-notify'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 't9md/vim-choosewin'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-autoformat/vim-autoformat'
call plug#end()

" Do not map F7.
autocmd BufRead,BufNewFile wscript setfiletype python
autocmd InsertEnter * set cul  " Highlight the current line in insert mode.
autocmd InsertLeave * set nocul
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
command Sw :execute ':silent w !sudo tee % > /dev/null' | :edit!
hi clear SignColumn  " Clear the sign column for gitgutter.
if !has('nvim') | set ttymouse=sgr | endif  " Needed for mouse to play well with tmux.
let &sbr = nr2char(8618).' '  " Show -> at the beginning of wrapped lines.
let b:SimpylFold_fold_docstring = 0
let b:SimpylFold_fold_import = 0
let g:NERDTreeMouseMode=3  " Single-click to open files.
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
let g:airline#extensions#tabline#enabled = 1
let g:autoformat_verbosemode=1
let g:choosewin_overlay_enable = 1
let g:formatters_python = ['yapf']
let g:hexmode_patterns = '*.bin,*.exe,*.o'
let g:rust_fold = 1
let g:vim_json_conceal=0
let solarized_termtrans=1
nnoremap <C-k> :Autoformat<CR>
nnoremap <C-w> :ChooseWin<CR>
nnoremap <F10> :Buffers<CR>
nnoremap <F11> :Files<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F9> :Ag<CR>
nnoremap <esc><esc> :noh<return>
nnoremap <space> za
nnoremap c :bp\|bd #<CR>
set background=light
set clipboard=unnamedplus  " Use the system clipboard by default
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
set pastetoggle=<F2>
set scrolloff=10  " Keep 10 lines visible around cursor.
set shortmess+=c
set signcolumn=yes  " Always show the sign column.
set smartcase  " Ignore case if pattern does not include an uppercase letter.
set termguicolors
set timeoutlen=1000 ttimeoutlen=0  " Timeout length for consecutive mappings and key codes, respectively.
set updatetime=300  " Length of time after typing stops to trigger plugin.
vnoremap <space> zf

" https://stsievert.com/blog/2016/01/06/vim-jekyll-mathjax
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

" https://jdhao.github.io/2020/05/22/highlight_yank_region_nvim
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
augroup END
