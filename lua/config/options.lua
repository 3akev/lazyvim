-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.conceallevel = 0
vim.g.maplocalleader = ","

vim.o.cursorline = true
vim.o.cursorlineopt = "number"

vim.cmd("highlight! CursorLineNr cterm=bold gui=bold guifg=#838ab3")

vim.o.list = true
vim.o.listchars = "tab:»·,trail:·,extends:»,precedes:«"

-- neovide options
if vim.g.neovide then
  vim.g.neovide_transparency = 0.65
  vim.g.neovide_scale_factor = 0.8

  vim.o.pumblend = 60
  vim.o.winblend = 60

  vim.api.nvim_set_hl(0, "Normal", { bg = "#1E1E2E" })
end

-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"
