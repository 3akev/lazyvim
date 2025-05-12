-- local util = require("lspconfig.util")
vim.filetype.add({
  pattern = {
    ["hypr.*%.conf"] = "hyprlang",
  },
})

return {
  -- declare language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        asm_lsp = {},
        terraformls = {},
        -- bashls = { mason = false },
        -- dartls = {},
        -- r_language_server = { mason = false },
        -- phpactor = {},
        -- vale_ls = { enabled = false },
        -- jdtls = {},
        -- ocamllsp = { mason = false, cmd = { "ocamllsp", "--fallback-read-dot-merlin" } },
        -- cssls = {},
        html = {},
        -- angularls = {},
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
        -- buf_ls = {
        --   root_dir = function(fname)
        --     -- vim.notify(vim.inspect(fname))
        --     local util = require("lspconfig.util")
        --     local match = util.search_ancestors(fname, function(path)
        --       local basename = string.gsub(path, ".*/", "")
        --       if basename == "proto" and util.path.exists(path) then
        --         return path
        --       end
        --     end)
        --
        --     if match ~= nil then
        --       return match
        --     end
        --   end,
        -- },
        -- pbls = {
        -- },
        hyprls = {},
        -- basedpyright = {
        --   settings = {
        --     basedpyright = {
        --       analysis = {
        --         typeCheckingMode = "basic",
        --       },
        --     },
        --   },
        --   -- handlers = {
        --   --   ["textDocument/publishDiagnostics"] = function() end,
        --   -- },
        -- },
      },
    },
  },
}
