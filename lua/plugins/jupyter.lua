local function set_jupynium_keymaps()
  vim.keymap.set(
    { "n", "x" },
    "<localleader>x",
    "<cmd>JupyniumExecuteSelectedCells<CR>",
    { buffer = true, desc = "Jupynium execute selected cells" }
  )
  vim.keymap.set(
    { "n", "x" },
    "<localleader>c",
    "<cmd>JupyniumClearSelectedCellsOutputs<CR>",
    { buffer = true, desc = "Jupynium clear selected cells" }
  )
  vim.keymap.set(
    { "n" },
    "<localleader>K",
    "<cmd>JupyniumKernelHover<cr>",
    { buffer = true, desc = "Jupynium hover (inspect a variable)" }
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
    { buffer = true, desc = "Jupynium toggle selected cell output scroll" }
  )
  -- vim.keymap.set("", "<PageUp>", "<cmd>JupyniumScrollUp<cr>", { buffer = buf_id, desc = "Jupynium scroll up" })
  -- vim.keymap.set("", "<PageDown>", "<cmd>JupyniumScrollDown<cr>", { buffer = buf_id, desc = "Jupynium scroll down" })

  -- server keymaps
  vim.keymap.set(
    { "n" },
    "<localleader>jj",
    "<cmd>JupyniumStartAndAttachToServer<cr>",
    { buffer = true, desc = "Jupynium start and attach to server" }
  )

  vim.keymap.set({ "n" }, "<localleader>js", function()
    return "<cmd>JupyniumStartSync " .. vim.fn.expand("%:t:r:r") .. "<cr>"
  end, { buffer = true, desc = "Jupynium start sync", expr = true })

  vim.keymap.set(
    { "n" },
    "<localleader>f",
    "<cmd>JupyniumShortsightedToggle<cr>",
    { buffer = true, desc = "Jupynium toggle shortsighted" }
  )
end

local filetypes = { "python" }

return {
  {
    "kiyoon/jupynium.nvim",
    -- ft = filetypes,
    keys = {
      { "<localleader>jj", mode = { "n" }, ft = filetypes, desc = "Jupynium start and attach to server" },
    },
    opts = {
      use_default_keybindings = false,
      jupynium_file_pattern = { "*.ju.py" },
    },
    config = function(_, opts)
      require("jupynium").setup(opts)

      -- set highlight groups for transparency
      vim.cmd([[
        hi! link JupyniumCodeCellSeparatorString Pmenu
        hi! JupyniumCodeCellSeparator cterm=bold gui=bold guifg=#ffc777
        hi! link JupyniumMarkdownCellSeparator Pmenu
        hi! link JupyniumMarkdownCellContent Pmenu
        hi! link JupyniumMagicCommand @keyword
        hi! JupyniumShortsighted guifg=#4b5271
      ]])

      set_jupynium_keymaps()

      -- stop sync when the buffer is closed
      vim.api.nvim_create_autocmd("BufDelete", {
        pattern = opts.jupynium_file_pattern,
        callback = function(event)
          -- dirty, but works
          if vim.fn.exists(":JupyniumStopSync") > 0 then
            vim.cmd("JupyniumStopSync")
          end
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
