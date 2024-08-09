-- local util = require("lspconfig.util")

return {
  -- declare language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- bashls = { mason = false },
        -- dartls = {},
        -- r_language_server = { mason = false },
        -- phpactor = {},
        -- vale_ls = { enabled = false },
        -- jdtls = {},
        -- ocamllsp = {},
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
              },
            },
          },
          -- handlers = {
          --   ["textDocument/publishDiagnostics"] = function() end,
          -- },
        },
      },
    },
  },
}
