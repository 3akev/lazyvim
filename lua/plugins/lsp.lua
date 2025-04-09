return {
  -- declare language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        asm_lsp = {},
        html = {},
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
      },
    },
  },
}
