local tectonic_toml = vim.fs.find("Tectonic.toml", { upward = true })[1]
local root_dir = vim.fs.dirname(tectonic_toml)

local get_idx_file = "ruby -n -e 'BEGIN{in_output=false}; if $_ =~ /output/ then in_output=true end; if in_output and $_ =~ /name\\s*=\\s*\"([^\"]*)/ then print $1 end' < "
  .. tectonic_toml
local build_subdir = vim.fn.system(get_idx_file)

local build_dir = root_dir .. "/build/" .. build_subdir
vim.env.VIMTEX_OUTPUT_DIRECTORY = build_dir

return {
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      vim.g.vimtex_compiler_method = "generic"
      vim.g.vimtex_compiler_generic = {
        command = "tectonic -X build --keep-logs --keep-intermediates",
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          rootDirectory = root_dir,
          forwardSearch = {
            executable = "okular",
            args = { "--unique", "file:%p#src:%l%f" },
          },
          build = {
            auxDirectory = build_dir,
            logDirectory = build_dir,
            pdfDirectory = build_dir,
            executable = "tectonic",
            args = {
              "-X",
              "compile",
              "%f",
              "--outdir " .. build_dir,
              "--synctex",
              "--keep-logs",
              "--keep-intermediates",
            },
            onSave = true,
          },
          chktex = {
            onEdit = true,
            onOpenAndSave = true,
          },
        },
        vale_ls = {},
      },
    },
  },
}
