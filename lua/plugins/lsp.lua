return {
  -- declare language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = { mason = false },
        dartls = {},
        r_language_server = { mason = false },
        phpactor = {},
        vale_ls = { enabled = false },
        jdtls = {},
      },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    opts = {
      root_dir = function()
        -- this works better for single files
        return vim.fn.expand("%:p:h")
      end,
    },
  },
}
