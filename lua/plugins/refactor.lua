return {
  -- multi-language refactoring plugin
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = true,
    config = true,
    event = "BufRead",
  },
}
