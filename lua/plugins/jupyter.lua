local function set_keymaps(buf_id)
  vim.keymap.set(
    { "n", "x" },
    "<localleader>x",
    "<cmd>JupyniumExecuteSelectedCells<CR>",
    { buffer = buf_id, desc = "Jupynium execute selected cells" }
  )
  vim.keymap.set(
    { "n", "x" },
    "<localleader>c",
    "<cmd>JupyniumClearSelectedCellsOutputs<CR>",
    { buffer = buf_id, desc = "Jupynium clear selected cells" }
  )
  vim.keymap.set(
    { "n" },
    "<localleader>K",
    "<cmd>JupyniumKernelHover<cr>",
    { buffer = buf_id, desc = "Jupynium hover (inspect a variable)" }
  )
  -- vim.keymap.set(
  --   { "n", "x" },
  --   "<localleader>js",
  --   "<cmd>JupyniumScrollToCell<cr>",
  --   { buffer = buf_id, desc = "Jupynium scroll to cell" }
  -- )
  vim.keymap.set(
    { "n", "x" },
    "<localleader>jo",
    "<cmd>JupyniumToggleSelectedCellsOutputsScroll<cr>",
    { buffer = buf_id, desc = "Jupynium toggle selected cell output scroll" }
  )
  vim.keymap.set("", "<PageUp>", "<cmd>JupyniumScrollUp<cr>", { buffer = buf_id, desc = "Jupynium scroll up" })
  vim.keymap.set("", "<PageDown>", "<cmd>JupyniumScrollDown<cr>", { buffer = buf_id, desc = "Jupynium scroll down" })

  -- server keymaps
  vim.keymap.set(
    { "n" },
    "<localleader>jj",
    "<cmd>JupyniumStartAndAttachToServer<cr>",
    { buffer = buf_id, desc = "Jupynium start and attach to server" }
  )

  vim.keymap.set({ "n" }, "<localleader>js", function()
    return "<cmd>JupyniumStartSync " .. vim.fn.expand("%:t:r:r") .. "<cr>"
  end, { buffer = buf_id, desc = "Jupynium start sync", expr = true })
end

return {
  {
    "kiyoon/jupynium.nvim",
    opt = {
      use_default_keybindings = false,
    },
    config = function(opts)
      local jupynium = require("jupynium")
      jupynium.setup(opts)

      vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        pattern = opts.jupynium_file_pattern,
        callback = function(event)
          set_keymaps(event.buf)
        end,
        -- group = "jupyniumaucmd",
      })

      -- stop sync when the buffer is closed
      vim.api.nvim_create_autocmd("BufDelete", {
        pattern = opts.jupynium_file_pattern,
        callback = function(event)
          vim.cmd("JupyniumStopSync")
        end,
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = vim.list_extend(opts.sources or {}, {
        { name = "jupynium", priority = 1000 },
      })
      return opts
    end,
  },
}
