if not vim.g.vscode then
  return {}
end

local vscode = require("vscode")

vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "

vim.notify = vscode.notify

vim.keymap.set({ "n", "x" }, "<leader>r", function()
  vscode.with_insert(function()
    vscode.action("editor.action.refactor")
  end)
end)

vim.keymap.set({ "n", "x" }, "<leader>fm", function()
  -- switch to the file explorer
  vscode.action("workbench.view.explorer")
  vscode.action("workbench.action.focusSideBar")
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "<leader>g", function()
  -- switch to git
  vscode.action("workbench.view.scm")
  vscode.action("workbench.action.focusSideBar")
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "<leader>aa", function()
  -- toggle copilot chat
  vscode.action("workbench.action.focusAuxiliaryBar")
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "<leader>ai", function()
  -- toggle copilot chat
  vscode.action("inlineChat.start")
end, { noremap = true, silent = true })

return {
  {
    "kdheepak/lazygit.nvim",
    enabled = false,
  },
}
