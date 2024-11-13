return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    keys = {
      -- QOL
      {
        "<ESC>",
        "<C-\\><C-n>",
        noremap = true,
        silent = true,
        desc = "Close terminal",
        mode = { "t" },
      },
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
      {
        "<C-w>",
        "<C-\\><C-n><C-w>",
        desc = "Window navigation",
        mode = { "t" },
      },

      -- Plugin
      {
        "<leader>v",
        "",
        desc = "+terminal",
      },
      {
        "<leader>vv",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        desc = "Toggle terminal horizontal",
        mode = { "n", "v" },
      },
      {
        "<leader>vt",
        "<cmd>ToggleTerm direction=tab<cr>",
        desc = "Toggle terminal in tab",
        mode = { "n", "v" },
      },
      {
        "<leader>vl",
        "<cmd>ToggleTermSendCurrentLine<cr>",
        desc = "Send current line to terminal",
        mode = { "n" },
      },
      {
        "<leader>vl",
        "<cmd>ToggleTermSendVisualLines<cr>",
        desc = "Send selected lines to terminal",
        mode = { "v" },
      },
      {
        "<leader>vs",
        "<cmd>ToggleTermSendVisualSelection<cr>",
        desc = "Send selection to terminal",
        mode = { "v" },
      },
    },
  },
}
