-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.lighter_setup then
  -- mini.completion keybinds
  vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
  vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
  vim.api.nvim_set_keymap("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], { noremap = true, expr = true })
end

vim.api.nvim_set_keymap("n", "<localleader>y", ":%y<CR>", { desc = "Yank buffer", noremap = true })

-- alternative dap keybinds
local dap = require("dap")
vim.keymap.set("n", "<F5>", function()
  dap.continue()
end, { desc = "[Debug] Continue" })
vim.keymap.set("n", "<F9>", function()
  dap.step_over()
end, { desc = "[Debug] Step over" })
vim.keymap.set("n", "<F10>", function()
  dap.step_into()
end, { desc = "[Debug] Step into" })
vim.keymap.set("n", "<F12>", function()
  dap.step_out()
end, { desc = "[Debug] Step out" })
