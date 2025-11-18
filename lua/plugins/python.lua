return {
  {
    "stevearc/conform.nvim",
    optional = true,

    opts = {
      formatters_by_ft = {
        python = { "ruff" },
        xml = { "xmllint" },
      },
      formatters = {
        ruff = { command = "ruff format" },
        injected = { options = { ignore_errors = true } },
      },
    },
  },
}
