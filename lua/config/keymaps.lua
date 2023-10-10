-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<localleader>y", ":%y<CR>", { desc = "Yank buffer", noremap = true })

if vim.g.vscode then
  local vscode_neovim = require("vscode-neovim")

  -- activate copilot suggestion with ctrl+/ in normal mode (only in vscode)
  vim.keymap.set("n", "<C-/>", function()
    vscode_neovim.notify("github.copilot.acceptCursorPanelSolution")
  end, { desc = "Accept copilot suggestion" })
else
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
end
