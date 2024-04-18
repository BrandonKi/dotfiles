vim.keymap.set("", "<Space>", "<Nop>")

vim.g.mapleader = ","

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("source $VIMRUNTIME/mswin.vim")

vim.opt.virtualedit = "onemore"
