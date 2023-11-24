-- filetype recognition for prolog
vim.filetype.add({
  pattern = {
    [".*%.ecl"] = "prolog",
    [".*%.pl"] = "prolog",
  },
})

return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.adapters.eclipseprolog = {
        type = "executable",
        command = "eclipse",
        args = { "-f", "${relativeFile}" },
      }
      dap.configurations.prolog = {
        {
          type = "eclipseprolog",
          request = "launch",
          name = "Run goal",
        },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        prolog = { "eclipsefmt" },
      },
      formatters = {
        eclipsefmt = { command = "eclipsefmt" },
      },
    },
  },
}
