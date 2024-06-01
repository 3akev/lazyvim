return {
  -- java lsp plugin
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      root_dir = function()
        -- this works better for single files
        return vim.fn.expand("%:p:h")
      end,
    },
  },
}
