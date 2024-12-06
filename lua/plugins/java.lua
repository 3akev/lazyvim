return {
  -- java lsp plugin
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      root_dir = function()
        local d = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])
        return d or vim.fn.expand("%:p:h")
      end,
    },
  },
}
