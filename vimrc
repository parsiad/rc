call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'Chiel92/vim-autoformat'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'LnL7/vim-nix'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
call plug#end()

autocmd BufRead,BufNewFile wscript setfiletype python
autocmd BufWritePost ~/.vimrc source $MYVIMRC  " Reload vimrc on save.
autocmd InsertEnter * set cul  " Highlight the current line in insert mode.
autocmd InsertLeave * set nocul
colorscheme solarized
let g:autoformat_verbosemode=1
let g:airline#extensions#tabline#enabled = 1
let g:racer_experimental_completer = 1
let g:solarized_termtrans = 1
let &sbr = nr2char(8618).' '  " Show -> at the beginning of wrapped lines.
set background=dark
set colorcolumn=80,120
set hidden  " Allow switching buffers even if current buffer is dirty.
set hlsearch  " Highlight search results.
set ignorecase  " Ignore case in search.
set list
set listchars=tab:>·,trail:~,extends:>,precedes:<  " , eol:¬
set mouse=a
set nopaste
set number relativenumber
set pastetoggle=<C-p>
set scrolloff=10  " Keep 10 lines visible around cursor.
set smartcase
set timeoutlen=1000 ttimeoutlen=0
set ttymouse=sgr
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:NERDTreeMouseMode=3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "active", "passive_filetypes": ["rust"] }
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
noremap <F5> :NERDTreeToggle<CR>
noremap <F6> :Buffers<CR>
noremap <F8> :Files<CR>
" Do not map F7.
noremap <F9> :Ag<CR>
noremap <C-a> :Autoformat<CR>

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap c :bp\|bd #<CR>

" Use gd and \gd to open Rust documentation and definition, respectively.
autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-def)
autocmd FileType rust nmap <buffer> gd         <Plug>(rust-doc)

" Underline in insert mode (should appear near end of vimrc).
hi CursorLine gui=underline cterm=underline

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
