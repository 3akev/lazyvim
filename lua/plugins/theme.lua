return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      term_colors = true,
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
          colored_indent_levels = false,
        },
        mason = true,
        noice = true,
      },
    },
    specs = {
      -- {
      --   "akinsho/bufferline.nvim",
      --   optional = true,
      --   opts = function(_, opts)
      --     if (vim.g.colors_name or ""):find("catppuccin") then
      --       opts.highlights = require("catppuccin.groups.integrations.bufferline").get_theme()
      --     end
      --   end,
      -- },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
