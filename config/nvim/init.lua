vim.cmd([[
autocmd vimenter * ++nested colorscheme solarized8
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
]])

local Plug = vim.fn["plug#"]
vim.call("plug#begin")
Plug("LnL7/vim-nix") -- Vim configuration files for Nix http://nixos.org/nix
Plug("Xuyuanp/nerdtree-git-plugin") -- A plugin of NERDTree showing git status
Plug("Yggdroot/indentLine") -- A vim plugin to display the indention levels with thin vertical lines
Plug("airblade/vim-gitgutter") -- A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug("arthurxavierx/vim-unicoder") -- unicoder.vim: easy unicode characters in insert mode with abbreviations
Plug("cespare/vim-toml") -- Vim syntax for TOML
Plug("chr4/nginx.vim") -- Improved nginx vim plugin (incl. syntax highlighting)
Plug("dccsillag/magma-nvim", { ["do"] = ":UpdateRemotePlugins" }) -- Interact with Jupyter from NeoVim.
Plug("ervandew/supertab") -- Perform all your vim insert mode completions with Tab
Plug("fidian/hexmode") -- Vim plugin to edit binary files in a hex mode automatically.
Plug("godlygeek/tabular") -- Vim script for text filtering and alignment
Plug("jremmen/vim-ripgrep") -- Use RipGrep in Vim and display results in a quickfix list
Plug("junegunn/fzf", { tag = "0.28.0" }) -- 🌸 A command-line fuzzy finder
Plug("junegunn/fzf.vim", { commit = "d6aa214" }) -- fzf ❤️ vim
Plug("junegunn/vim-peekaboo") -- " 👀 " / @ / CTRL-R
Plug("lifepillar/vim-solarized8") -- Optimized Solarized colorschemes. Best served with true-color terminals!
Plug("mboughaba/i3config.vim") -- Vim syntax highlighting for i3 config
Plug("ncm2/float-preview.nvim") -- Less annoying completion preview window based on neovim's floating window
Plug("neovim/nvim-lspconfig", { tag = "v0.1.0" }) -- Quickstart configs for Nvim LSP
Plug("preservim/nerdtree") -- A tree explorer plugin for vim
Plug("preservim/tagbar") -- Vim plugin that displays tags in a window, ordered by scope
Plug("ray-x/lsp_signature.nvim", { tag = "v0.1.1" }) -- LSP signature hint as you type
Plug("rcarriga/nvim-notify") -- A fancy, configurable, notification manager for NeoVim
Plug("rust-lang/rust.vim") -- Vim configuration for Rust.
Plug("ryanoasis/vim-devicons") -- Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
Plug("t9md/vim-choosewin") -- Land on window you chose like tmux's 'display-pane'
Plug("tpope/vim-sleuth") -- sleuth.vim: Heuristically set buffer options
Plug("vim-airline/vim-airline") -- lean & mean status/tabline for vim that's light as air
Plug("vim-airline/vim-airline-themes") -- A collection of themes for vim-airline
Plug("vim-autoformat/vim-autoformat") -- Provide easy code formatting in Vim by integrating existing code formatters.
vim.call("plug#end")

vim.cmd("hi clear SignColumn") -- https://news.ycombinator.com/item?id=5326397
vim.cmd("let &sbr = nr2char(8618).' '") -- Show -> at the beginning of wrapped lines.
vim.cmd("nnoremap c :bp\\|bd #<CR>")
vim.cmd("set guioptions=Ace")
vim.g.NERDTreeMouseMode = 3 -- Single-click to open files.
vim.g.SuperTabDefaultCompletionType = "<c-x><c-o>"
vim.g.airline_theme = "base16_solarized_light"
vim.g.autoformat_verbosemode = 1
vim.g.choosewin_overlay_enable = 1
vim.g.formatdef_stylua =
    "'stylua --indent-type Spaces --search-parent-directories --stdin-filepath ' . expand('%:p') .' -- -'"
vim.g.formatters_lua = { "stylua" }
vim.g.formatters_python = { "yapf" }
vim.g.hexmode_patterns = "*.bin,*.exe,*.o"
vim.g.rust_fold = 1
vim.g.solarized_termtrans = 1
vim.g.vim_json_conceal = 0
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["float_preview#docked"] = 1
vim.notify = require("notify")
vim.notify.setup({
    timeout = 2000,
})
vim.o.background = "light"
vim.o.clipboard = "unnamedplus" -- Use the system clipboard by default
vim.o.colorcolumn = "80,120"
vim.o.completeopt = "menu"
vim.o.encoding = "utf-8"
vim.o.foldmethod = "expr"
vim.o.foldtext = 'v:lua.foldtext()'
vim.o.hidden = true -- Allow switching buffers even if current buffer is dirty
vim.o.hlsearch = true -- Highlight search results
vim.o.ignorecase = true -- Ignore case in search
vim.o.list = true -- Show whitespace (see listchars below)
vim.o.listchars = "tab:>·,trail:~,extends:>,precedes:<" -- , eol:¬
vim.o.mouse = "a" -- Enable mouse in all modes
vim.o.number = true -- Show absolute number on current line
vim.o.paste = false -- Turn off paste mode
vim.o.pastetoggle = "<F2>"
vim.o.relativenumber = true -- Show relative line numbers on other lines
vim.o.scrolloff = 10 -- Keep 10 lines visible around cursor
vim.o.signcolumn = "yes" -- Always show the sign column
vim.o.smartcase = true -- Ignore case if pattern does not include an uppercase letter
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0 -- Timeout length for consecutive mappings and key codes, respectively
vim.o.updatetime = 300 -- Length of time after typing stops to trigger plugin

function _G.foldtext()
    local line = vim.fn.getline(vim.v.foldstart)
    if line:find("# %%", 1, true) == 1 then
        line = vim.fn.getline(vim.v.foldstart + 1)
    end
    local count = vim.v.foldend - vim.v.foldstart + 1
    return " ⚡ ".. line .. ": " .. count .. " lines"
end

vim.cmd([[
autocmd BufRead,BufNewFile wscript setfiletype python
autocmd InsertEnter * set cul  " Highlight the current line in insert mode.
autocmd InsertLeave * set nocul
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
nnoremap <C-a> :Autoformat<CR>
nnoremap <C-p> :Commands<CR>
nnoremap <C-w> :ChooseWin<CR>
nnoremap <F10> :Buffers<CR>
nnoremap <F11> :Files<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F9> :Ag<CR>
nnoremap <esc><esc> :noh<return>
nnoremap <space> za
nnoremap c :bp\|bd #<CR>
vnoremap <space> zf

" https://jdhao.github.io/2020/05/22/highlight_yank_region_nvim
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
augroup END

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

" https://github.com/dccsillag/magma-nvim
nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>
let g:magma_image_provider = "ueberzug"

" https://gist.github.com/BlueDrink9/f40b3c816e5bcb349adcbc22eb753518
function GetJupytextFold(linenum)
    if getline(a:linenum) =~ "^#\\s%%"
        " start fold
        return ">1"
    elseif getline(a:linenum + 1) =~ "^#\\s%%"
        return "<1"
    else
        return "-1"
    endif
endfunction
setlocal foldexpr=GetJupytextFold(v:lnum)
]])

-- https://github.com/neovim/nvim-lspconfig/tree/v0.1.0
local nvim_lsp = require("lspconfig")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
    -- Mappings.
    local opts = { noremap = true, silent = true }
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    buf_set_keymap("n", "<LocalLeader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
    })
end

require("lsp_signature").setup()
