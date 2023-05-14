-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if vim.g.enable_latex then
  vim.api.nvim_create_augroup("VimtexBuildOnSave", {})
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = "VimtexBuildOnSave",
    pattern = { "*.tex" },
    command = "VimtexCompileSS",
  })
end
