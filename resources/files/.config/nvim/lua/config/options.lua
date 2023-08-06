-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd([[
let mapleader = " "
let maplocalleader = ";"

nnoremap H ^
nnoremap L $
inoremap jk <esc>
inoremap Jk <esc>
inoremap JK <esc>

nnoremap <leader>w :update<cr>

nnoremap <leader>p :set paste<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>np :set nopaste<cr>

nnoremap <leader>et :e ~/.tmux.conf<cr>
nnoremap <leader>eb :e ~/.bash_profile<cr>
nnoremap <leader>ev :e ~/.config/nvim/lua/config/options.lua<cr>

nnoremap <leader>ls <cmd>Telescope file_browser path=%:p:h hidden=true<cr>
nnoremap <leader>bl <cmd>Telescope buffers<cr>

]])

-- tmux.nvim movement/resize keybindings
--movement
vim.keymap.set("n", "<M-h>", '<cmd>lua require("tmux").move_left()<cr>')
vim.keymap.set("n", "<M-j>", '<cmd>lua require("tmux").move_bottom()<cr>')
vim.keymap.set("n", "<M-k>", '<cmd>lua require("tmux").move_top()<cr>')
vim.keymap.set("n", "<M-l>", '<cmd>lua require("tmux").move_right()<cr>')

--resize
vim.keymap.set("n", "<M-H>", '<cmd>lua require("tmux").resize_left()<cr>')
vim.keymap.set("n", "<M-J>", '<cmd>lua require("tmux").resize_bottom()<cr>')
vim.keymap.set("n", "<M-K>", '<cmd>lua require("tmux").resize_top()<cr>')
vim.keymap.set("n", "<M-L>", '<cmd>lua require("tmux").resize_right()<cr>')

-- vim.api.nvim_set_keymap('n', 'foo', 'bar', { noremap = true, silent = true })
-- nnoremap <leader>f <cmd>Telescope find_files find_command=rg,--files,--iglob,!.git,--hidden<cr>

-- unmap Alt-j/k
-- Comment/uncomment files
-- move conjure to clojure.lua
-- add sexp, friendly sexp
-- language extras: python, json, go: https://www.lazyvim.org/extras/lang/json
-- don't put closing brace/paren, etc.
