return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon",
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    -- opts = {
    --   markdown = {
    --     headline_highlights = false,
    --   },
    -- },
    enabled = false,
  },
}
