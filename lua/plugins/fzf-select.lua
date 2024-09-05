return {
  {
    "ibhagwan/fzf-lua",
    opts = function(opts)
      vim.cmd([[FzfLua register_ui_select]])
      return opts
    end,
  },
}
