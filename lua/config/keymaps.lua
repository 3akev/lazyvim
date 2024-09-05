-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.verymagic")

-- disable middle click to paste, see :help <MiddleMouse>
vim.keymap.set({ "n", "i", "v" }, "<MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<2-MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<3-MiddleMouse>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<4-MiddleMouse>", "<Nop>")

if vim.g.neovide then
  -- emulate terminal behavior in neovide

  -- paste in terminal
  vim.keymap.set({ "t" }, "<C-S-v>", '<C-\\><C-N>"+pi', { noremap = true })
  -- paste in command mode
  vim.keymap.set({ "c", "i" }, "<C-S-v>", "<C-R>+", { noremap = true })
  -- paste in normal mode
  vim.keymap.set({ "n" }, "<C-S-v>", "p", { noremap = true })
end
