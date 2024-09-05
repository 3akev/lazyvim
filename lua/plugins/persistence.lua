return {
  {
    "folke/persistence.nvim",
    keys = {
      { "<leader>qS", require("persistence").select, "n", desc = "Select session" },
    },
  },
}
