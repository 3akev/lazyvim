vim.filetype.add({
  pattern = {
    [".*%.spdl"] = "scyther",
  },
})

return {
  {
    "stevearc/conform.nvim",
    optional = true,

    opts = {
      formatters_by_ft = {
        scyther = { "clang-format" },
      },
    },
  },
}
