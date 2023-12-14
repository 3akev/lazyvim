-- filetype recognition for prolog
-- return {}
vim.filetype.add({
  pattern = {
    [".*%.ecl"] = "prolog",
    [".*%.pl"] = "prolog",
  },
})

local pattern = "[^ ]+ (%d+),(%d+): syntax (error): (.*)"
local groups = { "lnum", "col", "severity", "message" }
local severity = {
  ["error"] = vim.lsp.protocol.DiagnosticSeverity.Error,
}

return {
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

  {
    "3akev/ecl.nvim",
    opts = {},
    ft = "prolog",
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      -- events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        -- Use the "*" filetype to run linters on all filetypes.
        -- ['*'] = { 'global linter' },
        -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
        -- ['_'] = { 'fallback linter' },
        prolog = { "eclipselint" },
      },
      -- LazyVim extension to easily override linter options
      -- or add custom linters.
      ---@type table<string,table>
      linters = {
        eclipselint = {
          cmd = "eclipselint",
          stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
          append_fname = false, -- Automatically append the file name to `args` if `stdin = false` (default: true)
          args = {}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
          stream = "stderr", -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
          ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
          -- env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
          parser = require("lint.parser").from_pattern(pattern, groups, severity, {}, {
            end_col_offset = 1,
          }),
        },
      },
    },
  },
}
