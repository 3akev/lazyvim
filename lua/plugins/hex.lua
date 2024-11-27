return {
  {
    "3akev/hexblade.nvim",
    -- dir = "/data/projects/lua/hexblade.nvim",
    -- dev = true,
    opts = {
      ncols = 16,
      chunk_size = 4,
    },
    keys = {
      {
        "<leader>h",
        desc = "Hexblade",
      },
      {
        "<leader>hh",
        "<Cmd>HexbladeToggle<CR>",
        desc = "Hexblade Toggle",
        mode = { "n" },
      },
      {
        "<leader>hf",
        "<Cmd>HexbladeFormatBuffer<CR>",
        desc = "Hexblade Format Buffer",
        mode = { "n" },
      },
      {
        "<leader>hs",
        "<Cmd>HexbladeSwap<CR>",
        desc = "Hexblade Swap",
        mode = { "n" },
      },
      {
        "<leader>hg",
        "<Cmd>HexbladeGotoAddress<CR>",
        desc = "Hexblade go to address",
        mode = { "n" },
      },
    },
  },
}
