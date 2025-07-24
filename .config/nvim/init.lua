-- function vim.keymap.set(mode, lhs, rhs, opts, { noremap = true, silent = true })
--     local options = { noremap = true, silent = true }
--     if opts then
--         options = vim.tbl_extend("force", options, opts)
--     end
--     vim.keymap.set(mode, lhs, rhs, options)
-- end

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd.filetype("on")
vim.cmd.filetype("plugin on")


-- vim.cm
-- alias ez="nvim ~/.zshrc"
-- alias ev="nvim ~/.config/nvim/init.lua"
vim.keymap.set("n", "<leader>ev", ":e ~/.config/nvim/init.lua<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ez", ":e ~/.zshrc<cr>", { noremap = true, silent = true })


vim.keymap.set("i", "jk", "<esc>", { noremap = true, silent = true })
vim.keymap.set("i", "Jk", "<esc>", { noremap = true, silent = true })
vim.keymap.set("i", "JK", "<esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", ":w<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q!<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":x<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "H", "0", { noremap = true, silent = true })

--
-- buffers
--
vim.keymap.set("n", "<leader>bb", ":b#<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<cr>", { noremap = true, silent = true })
-- <leader>bl mapped to buffer list in fzf-lua plugin file

--
-- panes
--
vim.keymap.set("n", "<leader>vs", "<c-w>v", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>hs", "<c-w>s", { noremap = true, silent = true })
vim.keymap.set("n", "<c-h>", "<c-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<c-j>", "<c-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<c-k>", "<c-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<c-l>", "<c-w>l", { noremap = true, silent = true })

--
-- tabs
--
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set tabstop=2")
vim.cmd("set expandtab")

--
-- other
--

-- Source the nvim config file
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<cr>:echo 'Sourced ' . $MYVIMRC<cr>", { noremap = true, silent = true})

-- Set pwd to directory of current file and print it
vim.keymap.set("n", "<leader>cd", ":lcd %:p:h<cr>:pwd<cr>", { noremap = true, silent = true })

-- Open current directory
vim.keymap.set("n", "<leader>ls", ":e <C-R>=expand('%:h').'/'<cr><cr>", { noremap = true, silent = true })

-- Line numbers and toggle
vim.cmd("set number")
vim.keymap.set("n", "<c-n><c-n>", ":set invnumber<cr>", { noremap = true, silent = true })

-- Shift blocks of text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Indent blocks of text
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- LSPs
-- vim.lsp.config('clojure-lsp', {
--   -- Server-specific settings. See `:help lsp-quickstart`
--   settings = {
--     ['clojure-lsp'] = {},
--   },
-- })
-- vim.lsp.enable('clojure-lsp')


require("config.lazy")
