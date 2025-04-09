return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
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
          scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        mason = true,
        noice = true,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "catppuccin",
    },
  },
}
