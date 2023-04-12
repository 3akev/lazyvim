-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.lighter_setup then
  -- mini.completion keybinds
  vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
  vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
  vim.api.nvim_set_keymap("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], { noremap = true, expr = true })
end
vim.api.nvim_set_keymap("n", "<leader>y", ":%y<CR>", { desc = "Yank buffer", noremap = true })
