-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_augroup("VimtexBuildOnSave", {})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = "VimtexBuildOnSave",
  pattern = { "*.tex" },
  callback = function(_)
    vim.cmd("silent !mkdir -p " .. vim.g.c_vimtex_build_dir)
    vim.cmd("VimtexCompileSS")
  end,
})
