-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.verymagic")

-- disable middle click to paste, see :help <MiddleMouse>
vim.keymap.set({ "n", "i", "v" }, "<MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<2-MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<3-MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<4-MiddleMouse>", "<Nop>")
