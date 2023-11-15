return {
  -- declare language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- disable pywright and ruff, use jedi-language-server
        pyright = { enabled = false, mason = false },
        -- ruff_lsp = { enabled = false, mason = false },
        jedi_language_server = {},

        bashls = { mason = false },
        dartls = {},
        r_language_server = { mason = false },
      },
    },
  },
}
