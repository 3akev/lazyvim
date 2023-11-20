-- if not vim.g.enable_latex then
--   return {}
-- end

return {
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      vim.g.vimtex_compiler_method = "tectonic"
      vim.g.vimtex_compiler_tectonic = {
        out_dir = vim.g.c_vimtex_build_dir,
        options = { "--synctex", "--keep-logs", "--keep-intermediates" },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.list_extend(opts.servers or {}, {
        texlab = {
          build = {
            auxDirectory = vim.g.c_vimtex_build_dir,
            logDirectory = vim.g.c_vimtex_build_dir,
            pdfDirectory = vim.g.c_vimtex_build_dir,
            executable = "tectonic",
            args = { "--synctex", "--keep-logs", "--keep-intermediates", "%f" },
            onSave = true,
          },
          chktex = {
            onEdit = true,
            onOpenAndSave = true,
          },
        },
        ltex = {
          settings = {
            ltex = {
              language = vim.g.ltex_language,
            },
          },
        },
      })
    end,
  },
  {
    "icewind/ltex-client.nvim",
    opts = {
      user_dictionaries_path = vim.env.HOME .. "/.config/nvim/ltek",
    },
  },
}
