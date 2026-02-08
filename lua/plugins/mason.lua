return {
  {
    "mason-org/mason.nvim",
    config = function(opts)
      require("mason").setup(opts)
      local registry = require("mason-registry")

      -- pin tree-sitter-cli to v0.25.10 to fix GLIBC
      local pkg = registry.get_package("tree-sitter-cli")
      if not pkg.is_installed(pkg) then
        pkg.install(pkg, {
          version = "v0.25.10",
        })
      end
    end,
  },
}
