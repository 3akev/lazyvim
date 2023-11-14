return {
  -- declare language servers
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.list_extend(opts.servers or {}, {
        bashls = { mason = false },
        dartls = {},
        r_language_server = { mason = false },
      })
    end,
  },
}
