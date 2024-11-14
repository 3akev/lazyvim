local function toggleterm(cmd)
  -- include count as that is used as the terminal number
  return function()
    vim.cmd(vim.v.count1 .. cmd)
  end
end

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

      -- Plugin
      {
        "<leader>v",
        "",
        desc = "+terminal",
      },
      {
        "<leader>vv",
        toggleterm("ToggleTerm direction=horizontal"),
        desc = "Toggle terminal horizontal",
        mode = { "n", "v" },
      },
      {
        "<leader>vb",
        toggleterm("ToggleTerm direction=horizontal dir=%:p:h"),
        desc = "Toggle terminal in buffer directory",
        mode = { "n", "v" },
      },
      {
        "<leader>vt",
        toggleterm("ToggleTerm direction=tab"),
        desc = "Toggle terminal in tab",
        mode = { "n", "v" },
      },
      {
        "<leader>vl",
        toggleterm("ToggleTermSendCurrentLine"),
        desc = "Send current line to terminal",
        mode = { "n" },
      },
      {
        "<leader>vl",
        toggleterm("ToggleTermSendVisualLines"),
        desc = "Send selected lines to terminal",
        mode = { "v" },
      },
      {
        "<leader>vs",
        toggleterm("ToggleTermSendVisualSelection"),
        desc = "Send selection to terminal",
        mode = { "v" },
      },
    },
  },
}
