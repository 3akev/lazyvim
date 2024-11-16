return {
  {
    "folke/snacks.nvim",
    keys = {
      -- {
      --   "<ESC>",
      --   "<C-\\><C-n>",
      --   noremap = true,
      --   silent = true,
      --   desc = "Exit terminal mode",
      --   mode = { "t" },
      -- },
      {
        "<C-h>",
        "<Cmd>wincmd h<CR>",
        desc = "Move to left window",
        mode = { "t" },
      },
      {
        "<C-j>",
        "<Cmd>wincmd j<CR>",
        desc = "Move to bottom window",
        mode = { "t" },
      },
      {
        "<C-k>",
        "<Cmd>wincmd k<CR>",
        desc = "Move to up window",
        mode = { "t" },
      },
      {
        "<C-l>",
        "<Cmd>wincmd l<CR>",
        desc = "Move to right window",
        mode = { "t" },
      },
    },
  },
}
