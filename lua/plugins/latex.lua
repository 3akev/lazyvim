--
-- local root_dir = ""
-- local build_dir = ""
-- -- local tectonic_toml = vim.fs.find("Tectonic.toml", { upward = true })[1]
-- -- if tectonic_toml ~= nil then
-- --   root_dir = vim.fs.dirname(tectonic_toml)
-- --
-- --   local get_idx_file = "ruby -n -e 'BEGIN{in_output=false}; if $_ =~ /output/ then in_output=true end; if in_output and $_ =~ /name\\s*=\\s*\"([^\"]*)/ then print $1 end' < "
-- --     .. '"' .. tectonic_toml .. '"'
-- --   local build_subdir = vim.fn.system(get_idx_file)
-- --
-- --   build_dir = root_dir .. "/build/" .. build_subdir
-- --   vim.env.VIMTEX_OUTPUT_DIRECTORY = build_dir
-- --
-- --   vim.api.nvim_create_autocmd("BufReadPre", {
-- --     pattern = "*",
-- --     callback = function()
-- --       local get_main_file = "ruby -n -e 'BEGIN{in_output=false}; if $_ =~ /output/ then in_output=true end; if in_output and $_ =~ /index\\s*=\\s*\"([^\"]*)/ then print $1 end' < "
-- --         .. '"' .. tectonic_toml .. '"'
-- --       local main_file = vim.fn.system(get_main_file)
-- --       vim.b.vimtex_main = root_dir .. "/src/" .. main_file
-- --     end,
-- --   })
-- -- end

return {
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      vim.g.vimtex_compiler_method = "generic"
      -- vim.g.vimtex_compiler_tectonic = {
      --   out_dir = "./build",
      --   options = {
      --     "--keep-logs",
      --     "--keep-intermediates",
      --     "--synctex",
      --     "-Z search-path=/usr/share/texmf-dist/tex/latex/biblatex",
      --   },
      -- }
      vim.g.vimtex_compiler_generic = {
        command = "ls *.tex | entr -n tectonic $(ls *.tex) -Z search-path=/usr/share/texmf-dist/tex/latex/biblatex --synctex --keep-logs --keep-intermediates --outdir=./build",
      }
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
