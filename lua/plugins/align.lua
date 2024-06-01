return {
  {
    "echasnovski/mini.align",
    keys = {
      { "<leader>ga", desc = "Align" },
      { "<leader>gA", desc = "Align with preview" },
    },
    version = false,
    config = function()
      require("mini.align").setup({
        mappings = {
          start = "<leader>ga",
          start_with_preview = "<leader>gA",
        },
      })
    end,
  },
}
