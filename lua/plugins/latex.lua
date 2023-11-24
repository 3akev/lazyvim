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
    opts = {
      servers = {
        texlab = {
          build = {
            auxDirectory = vim.g.c_vimtex_build_dir,
            logDirectory = vim.g.c_vimtex_build_dir,
            pdfDirectory = vim.g.c_vimtex_build_dir,
            executable = "tectonic",
            args = { "--synctex", "--keep-logs", "--keep-intermediates", "%f" },
            onSave = false,
          },
          chktex = {
            onEdit = true,
            onOpenAndSave = true,
          },
        },
        ltex = {
          settings = {
            ltex = {
              language = "fr",
            },
          },
        },
      },
    },
  },

  {
    "icewind/ltex-client.nvim",
    ft = { "tex", "bib" },
    opts = {
      user_dictionaries_path = vim.env.HOME .. "/.config/nvim/ltek",
    },
  },
}
