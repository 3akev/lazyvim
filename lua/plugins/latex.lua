-- if not vim.g.enable_latex then
--   return {}
-- end

return {
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      -- use tectonic CLI V2 interface
      vim.g.vimtex_compiler_method = "tectonic"
      vim.g.vimtex_compiler_tectonic = {
        build_dir = "./build",
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
            executable = "tectonic",
            args = { "--synctex", "--keep-logs", "--keep-intermediates" },
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
