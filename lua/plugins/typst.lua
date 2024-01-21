vim.filetype.add({
  pattern = {
    [".*%.typ"] = "typst",
  },
})

return {

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typst_lsp = {},
      },
    },
  },

  {
    "chomosuke/typst-preview.nvim",
    -- lazy = false,
    ft = "typst",
    -- version = "0.1.*",
    build = function()
      require("typst-preview").update()
    end,
  },
}
