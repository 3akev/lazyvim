return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local remove_sources = { "markdownlint" }
      opts.sources = vim.tbl_filter(function(source)
        return not vim.tbl_contains(remove_sources, source.name)
      end, opts.sources)
    end,
  },
}
