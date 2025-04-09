return {
  -- hijack netrw even when file manager is loaded lazily
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        hijack_netrw_behavior = "disabled",
      },
    },
  },
  {
    "echasnovski/mini.files",
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        -- make a group to be able to delete it later
        group = vim.api.nvim_create_augroup("MiniFilesLazyInit", { clear = true }),
        callback = function()
          local f = vim.fn.expand("%:p")
          if vim.fn.isdirectory(f) ~= 0 then
            require("mini.files").open(f, true)
            -- mini.files is loaded now, delete the init autocmd
            vim.api.nvim_clear_autocmds({ group = "MiniFilesLazyInit" })
          end
        end,
      })
    end,
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
  },
}
