-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- https://neovim.io/doc/user/map.html

-- TODO
-- change leader key to something else, while space is intuitive it isn't exactly easy to press
--
-- this stuff I'll add as I need it, hopefully I get used to the new stuff though
-- figure out the keybinds or change them to the old ones:
--     make ctrl-backspace delete a whole word
--     make ctrl-d delete whole world in other direction, or rest of the line
--     make ctrl-S-d delelete the whole line

local builtin = require("telescope.builtin")

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Change C-g to escape, matches emacs muscle memory
-- unfortunately this doesn't work too great
keymap("i", "<C-g>", "<ESC>", default_opts)
keymap("n", "<C-g>", "<ESC>", default_opts)
keymap("c", "<C-g>", "<ESC>", default_opts)

-- remap the full current buffer search
vim.keymap.set("n", "<C-s>", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("i", "<C-s>", builtin.current_buffer_fuzzy_find, {})

-- remap the common file search to something quicker
vim.keymap.set("n", "<C-f>", builtin.find_files, {})

-- remap save
keymap("i", "<C-x><C-s>", "<ESC>:w<CR>", default_opts)
keymap("n", "<C-x><C-s>", ":w<CR>", default_opts)

-- make backspace delete text in select
keymap("s", "<BS>", "<Del>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
-- keymap("v", "<", "<gv", default_opts)
-- keymap("v", ">", ">gv", default_opts)
keymap("v", "<S-Tab>", "<gv", default_opts)
keymap("v", "<Tab>", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- pageup/down
keymap("i", "<C-Up>", "<PageUp>", default_opts)
keymap("i", "<C-Down>", "<PageDown>", default_opts)
keymap("n", "<C-Up>", "<PageUp>", default_opts)
keymap("n", "<C-Down>", "<PageDown>", default_opts)

-- jump words using ctrl-left/right
keymap("n", "<C-Left>", "b", default_opts)
keymap("n", "<C-Right>", "w", default_opts)

-- binds for begin/end of line (this is a crutch while I get used to vim stuff)
keymap("i", "<C-a>", "0", default_opts)
keymap("i", "<C-e>", "$", default_opts)
keymap("i", "<C-a>", "<ESC>I", default_opts)
keymap("i", "<C-e>", "<ESC>A", default_opts)

-- Highlight line
keymap("n", "vv", "0v$", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

keymap("v", "<M-Up>", ":move '<-2<CR>gv-gv", default_opts)
keymap("v", "<M-Down>", ":move '>+1<CR>gv-gv", default_opts)

-- window navigation
keymap("n", "<C-w><Left>", "<C-w>h", default_opts)
keymap("n", "<C-w><Right>", "<C-w>l", default_opts)
keymap("n", "<C-w><Up>", "<C-w>k", default_opts)
keymap("n", "<C-w><Down>", "<C-w>j", default_opts)

-- CHANGE THIS
-- Resizing panes
keymap("n", "<Leader><Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Leader><Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Leader><Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Leader><Down>", ":resize +1<CR>", default_opts)
