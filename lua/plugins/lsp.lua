-- local util = require("lspconfig.util")
vim.filetype.add({
  pattern = {
    ["hypr.*%.conf"] = "hyprlang",
  },
})

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
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
        pbls = {},
        hyprls = {},
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
