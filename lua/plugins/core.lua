-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- { "folke/noice.nvim",        enabled = false },

  {
    "nvimtools/none-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(
          ".null-ls-root",
          ".neoconf.json",
          "makefile",
          "Makefile",
          ".git"
        ),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,

          nls.builtins.formatting.stylua,

          -- nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.ruff,
          nls.builtins.formatting.yapf,
        },
      }
    end,
  },

  -- declare language servers
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        clangd = {
          capabilities = {
            textDocument = {
              completion = {
                editsNearCursor = true,
              },
            },
            offsetEncoding = 'utf-16',
          }
        },
        jedi_language_server = {
          -- enabled = false,
        }, -- pip install --user -U jedi-language-server
        pylsp = {
          enabled = false,
          -- :PylspInstall python-lsp-ruff pyls-isort
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
                mccabe = { enabled = false },
              }
            }
          }
        },
        bashls = { mason = false },
        jsonls = { mason = false },
        jdtls = {},
      },
    },
  },

  -- plugin for java
  {
    "mfussenegger/nvim-jdtls"
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "json",
        "lua",
        "python",
        "regex",
        "vim",
        "yaml",
        "c"
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
        "texlab",
        -- "yapf",
        -- "ruff",
        -- "isort",
      },
    },
  },
}
