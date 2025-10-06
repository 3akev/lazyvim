return {
  {
    "nvim-mini/mini.align",
    keys = {
      { "<localleader>a", desc = "Align", mode = { "n", "v" } },
      { "<localleader>A", desc = "Align with preview", mode = { "n", "v" } },
    },
    version = false,
    config = function()
      require("mini.align").setup({
        mappings = {
          start = "<localleader>a",
          start_with_preview = "<localleader>A",
        },
      })
    end,
  },
}
