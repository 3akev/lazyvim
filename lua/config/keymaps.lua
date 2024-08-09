-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.verymagic")

-- refactoring plugin keymaps
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- disable middle click to paste, see :help <MiddleMouse>
vim.keymap.set({ "n", "i", "v" }, "<MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<2-MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<3-MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<4-MiddleMouse>", "<Nop>")
