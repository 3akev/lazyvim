return {
  {
    "stevearc/conform.nvim",
    optional = true,

    opts = {
      formatters_by_ft = {
        python = { "ruff" },
      },
      formatters = {
        ruff = { command = "ruff format" },
        injected = { options = { ignore_errors = true } },
      },
    },
  },
}
