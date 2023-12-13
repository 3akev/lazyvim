return {
  -- declare language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = { mason = false },
        dartls = {},
        r_language_server = { mason = false },
        -- prolog_ls = {},
      },
    },
  },
}
