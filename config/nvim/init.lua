local Plug = vim.fn["plug#"]
vim.call("plug#begin")
Plug("LnL7/vim-nix") -- Vim configuration files for Nix http://nixos.org/nix
Plug("Xuyuanp/nerdtree-git-plugin") -- A plugin of NERDTree showing git status
Plug("Yggdroot/indentLine") -- A vim plugin to display the indention levels with thin vertical lines
Plug("airblade/vim-gitgutter") -- A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug("arthurxavierx/vim-unicoder") -- unicoder.vim: easy unicode characters in insert mode with abbreviations
Plug("cespare/vim-toml") -- Vim syntax for TOML
Plug("chr4/nginx.vim") -- Improved nginx vim plugin (incl. syntax highlighting)
Plug("ervandew/supertab") -- Perform all your vim insert mode completions with Tab
Plug("fidian/hexmode") -- Vim plugin to edit binary files in a hex mode automatically.
Plug("godlygeek/tabular") -- Vim script for text filtering and alignment
Plug("jremmen/vim-ripgrep") -- Use RipGrep in Vim and display results in a quickfix list
Plug("junegunn/fzf.vim") -- fzf heart vim
Plug("junegunn/vim-peekaboo") -- " / @ / CTRL-R
Plug("lifepillar/vim-solarized8") -- Optimized Solarized colorschemes. Best served with true-color terminals!
Plug("mboughaba/i3config.vim") -- Vim syntax highlighting for i3 config
Plug("ncm2/float-preview.nvim") -- Less annoying completion preview window based on neovim's floating window
Plug("neovim/nvim-lspconfig") -- Quickstart configs for Nvim LSP
Plug("preservim/nerdtree") -- A tree explorer plugin for vim
Plug("preservim/tagbar") -- Vim plugin that displays tags in a window, ordered by scope
Plug("ray-x/lsp_signature.nvim") -- LSP signature hint as you type
Plug("rcarriga/nvim-notify") -- A fancy, configurable, notification manager for NeoVim
Plug("rust-lang/rust.vim") -- Vim configuration for Rust.
Plug("ryanoasis/vim-devicons") -- Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
Plug("t9md/vim-choosewin") -- Land on window you chose like tmux's 'display-pane'
Plug("tmhedberg/SimpylFold") -- No-BS Python code folding for Vim
Plug("tpope/vim-sleuth") -- sleuth.vim: Heuristically set buffer options
Plug("vim-airline/vim-airline") -- lean & mean status/tabline for vim that's light as air
Plug("vim-airline/vim-airline-themes") -- A collection of themes for vim-airline
Plug("vim-autoformat/vim-autoformat") -- Provide easy code formatting in Vim by integrating existing code formatters.
vim.call("plug#end")

vim.api.nvim_create_autocmd({ "VimEnter" }, { command = "NERDTree" })
vim.api.nvim_create_autocmd({ "VimEnter" }, { command = "wincmd p" })
vim.api.nvim_set_keymap("n", "<C-k>", ":Autoformat<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w>", ":ChooseWin<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F10>", ":Buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F11>", ":Files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F5>", ":NERDTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F6>", ":TagbarToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F9>", ":Ag<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<esc><esc>", ":noh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>", "za", { noremap = true })
vim.api.nvim_set_keymap("v", "<space>", "zf", { noremap = true })
vim.b.SimpylFold_fold_docstring = 0
vim.b.SimpylFold_fold_import = 0
vim.cmd("hi clear SignColumn") -- https://news.ycombinator.com/item?id=5326397
vim.cmd("let &sbr = nr2char(8618).' '") -- Show -> at the beginning of wrapped lines.
vim.cmd("nnoremap c :bp\\|bd #<CR>")
vim.cmd.colorscheme("solarized8")
vim.g.NERDTreeMouseMode = 3 -- Single-click to open files.
vim.g.SimpylFold_fold_docstring = 0
vim.g.SimpylFold_fold_import = 0
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
vim.o.background = "light"
vim.o.clipboard = "unnamedplus" -- Use the system clipboard by default
vim.o.colorcolumn = "80,120"
vim.o.completeopt = "menu"
vim.o.encoding = "utf-8"
vim.o.guioptions = "Ace"
vim.o.hidden = true -- Allow switching buffers even if current buffer is dirty
vim.o.hlsearch = true -- Highlight search results
vim.o.ignorecase = true -- Ignore case in search
vim.o.list = true -- Show whitespace (see listchars below)
vim.o.listchars = "tab:>·,trail:~,extends:>,precedes:<" -- , eol:¬
vim.o.mouse = "a" -- Enable mouse in all modes
vim.o.paste = false -- Turn off paste mode
vim.o.pastetoggle = "<F2>"
vim.o.relativenumber = true -- Show absolute current line number and relative line numbers
vim.o.scrolloff = 10 -- Keep 10 lines visible around cursor
vim.o.signcolumn = "yes" -- Always show the sign column
vim.o.smartcase = true -- Ignore case if pattern does not include an uppercase letter
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0 -- Timeout length for consecutive mappings and key codes, respectively
vim.o.ttymouse = "sgr" -- Needed for mouse to play well with tmux
vim.o.updatetime = 300 -- Length of time after typing stops to trigger plugin

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    -- https://github.com/preservim/nerdtree/issues/21
    command = "if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    callback = function(ev)
        vim.o.ft = "python"
    end,
    pattern = { "wscript" },
})

-- Highlight the current line in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function(ev)
        vim.o.cul = true
    end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function(ev)
        vim.o.cul = false
    end,
})

-- https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function(ev)
        vim.highlight.on_yank()
    end,
})

-- https://stsievert.com/blog/2016/01/06/vim-jekyll-mathjax
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile", "BufRead" }, {
    callback = function(ev)
        vim.cmd([[
        syn region math start=/\$\$/ end=/\$\$/
        syn match math_block '\$[^$].\{-}\$'
        syn match liquid '{%.*%}'
        syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
        syn region highlight_block start='```' end='```'
        hi link math Statement
        hi link liquid Statement
        hi link highlight_block Function
        hi link math_block Function
        ]])
    end,
    pattern = { "*.md", "*.markdown" },
})

-- https://github.com/neovim/nvim-lspconfig
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.clangd.setup({})
require "lsp_signature".setup()
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
