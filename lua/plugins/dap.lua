-- local pickers = require("telescope.pickers")
-- local finders = require("telescope.finders")
-- local conf = require("telescope.config").values
-- local actions = require("telescope.actions")
-- local action_state = require("telescope.actions.state")
--
-- local function telescope_executable()
--   return coroutine.create(function(coro)
--     local opts = {}
--     pickers
--       .new(opts, {
--         prompt_title = "Path to executable",
--         finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
--         sorter = conf.generic_sorter(opts),
--         attach_mappings = function(buffer_number)
--           actions.select_default:replace(function()
--             actions.close(buffer_number)
--             coroutine.resume(coro, action_state.get_selected_entry()[1])
--           end)
--           return true
--         end,
--       })
--       :find()
--   end)
-- end

return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "mfussenegger/nvim-dap" },
    },
    opts = {
      {
        ensure_installed = { "python", "cppdbg" },
        -- handlers = {
        --   function(config)
        --     -- all sources with no handler get passed here
        --
        --     -- Keep original functionality
        --     require("mason-nvim-dap").default_setup(config)
        --   end,
        --   cppdbg = function(config)
        --     config.configurations = {
        --       {
        --         name = "Launch file",
        --         type = "cppdbg",
        --         request = "launch",
        --         program = telescope_executable(),
        --         cwd = "${workspaceFolder}",
        --         stopAtEntry = true,
        --       },
        --       {
        --         name = "Attach to gdbserver :1234",
        --         type = "cppdbg",
        --         request = "launch",
        --         MIMode = "gdb",
        --         miDebuggerServerAddress = "localhost:1234",
        --         miDebuggerPath = vim.fn.exepath("gdb"),
        --         cwd = "${workspaceFolder}",
        --         program = telescope_executable(),
        --       },
        --       -- {
        --       --   name = "Launch an executable",
        --       --   type = "cppdbg",
        --       --   request = "launch",
        --       --   cwd = "${workspaceFolder}",
        --       --   program = telescope_executable(),
        --       -- },
        --     }
        --     require("mason-nvim-dap").default_setup(config) -- don't forget this!
        --   end,
        -- },
      },
    },
  },

  -- {
  --   "nvim-telescope/telescope-dap.nvim",
  -- },
  --
  -- {
  --   "rcarriga/cmp-dap",
  --   config = function(_, opts)
  --     require("cmp").setup(opts)
  --     require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  --       sources = {
  --         { name = "dap" },
  --       },
  --     })
  --   end,
  --   opts = {
  --     enabled = function()
  --       return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
  --     end,
  --   },
  -- },
}
