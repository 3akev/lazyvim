vim.filetype.add({
  pattern = {
    [".*%.typ"] = "typst",
  },
})

return {
  {
    "stevearc/conform.nvim",
    optional = true,

    opts = {
      formatters_by_ft = {
        typst = { "typstyle" },
      },
      formatters = {
        typstyle = { command = "typstyle" },
        -- typstfmt = { command = "typstfmt" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        tinymist = {
          single_file_support = true,
          root_dir = function()
            return vim.fn.getcwd()
          end,
          settings = {
            -- formatterMode = "typstyle",
          },
        },
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

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tinymist",
      },
    },
  },
}
