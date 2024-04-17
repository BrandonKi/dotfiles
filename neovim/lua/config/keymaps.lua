-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- https://neovim.io/doc/user/map.html

-- TODO
-- figure out what that error that keeps popping up means, it's annoying! >:(
--
-- switch between buffers with ctrl-tab and ctrl-S-tab
--
-- ctrl-s to search current buffer probably, would mimic my emacs but ctrl-f would mimic everything else
--     actually I would have to change save to something else then
--
-- move text with alt-up, alt-down in select mode
--
-- ctrl-[ to ctrl-g, just for muscle memory tbh
--
-- switch indent/outdent from >/< to tab S-tab when in select/visual mode
--
-- change leader key to something else, while space is intuitive it isn't exactly easy to press
--
-- switch tab to 4 spaces, everywhere
--
-- figure out the keybinds or change them to the old ones:
--     begin/end of current line with ctrl-a and ctrl-e
--     make ctrl-backspace delete a whole word
--     make ctrl-d delete whole world in other direction, or rest of the line
--     make ctrl-S-d delelete the whole line
--
-- make ctrl-up/down go through the suggestion menu, that way normal up/down aren't blocked
-- also maybe switch enter to ctrl-enter in that menu as well
--
-- ctrl left/right to jump by words
--
-- change window resizing to ctrl-S-left/right/down etc

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
-- keymap("i", "jk", "<ESC>", default_opts)
-- keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
-- keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
--  keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
-- keymap("n", "<Up>", ":resize -1<CR>", default_opts)
-- keymap("n", "<Down>", ":resize +1<CR>", default_opts)
