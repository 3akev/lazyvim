return {
  -- only enable rope autoimport from pylsp, use pyright and ruff from python extra
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       jedi_language_server = { enabled = false, mason = false },
  --       pylsp = {
  --         settings = {
  --           pylsp = {
  --             plugins = {
  --               pycodestyle = { enabled = false },
  --               pyflakes = { enabled = false },
  --               mccabe = { enabled = false },
  --               autopep8 = { enabled = false },
  --               flake8 = { enabled = false },
  --               jedi_completion = { enabled = false },
  --               jedi_hover = { enabled = false },
  --               jedi_definition = { enabled = false },
  --               jedi_references = { enabled = false },
  --               jedi_signature_help = { enabled = false },
  --               jedi_symbols = { enabled = false },
  --               preload = { enabled = false },
  --               pydocstyle = { enabled = false },
  --               pylint = { enabled = false },
  --               yapf = { enabled = false },
  --               rope_completion = { enabled = false },
  --
  --               rope_autoimport = { enabled = true },
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
}