if not vim.g.lighter_setup then
  return {}
end

return {
  -- disable some ui stuff, for a simpler ui
  { "rcarriga/nvim-notify", enabled = false },
  { "stevearc/dressing.nvim", enabled = false },

  -- disable mason
  { "williamboman/mason.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },

  -- use mini.completion instead of nvim-cmp
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "hrsh7th/cmp-luasnip", enabled = false },

  {
    "echasnovski/mini.completion",
    version = false,
    event = "BufEnter",
    config = true,
    main = "mini.completion",
    opts = {
      delay = { completion = 100, info = 100, signature = 50 },
      window = {
        info = { height = 25, width = 80, border = "none" },
        signature = { height = 25, width = 80, border = "none" },
      },
      lsp_completion = { source_func = "completefunc", auto_setup = false },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      { "hrsh7th/cmp-nvim-lsp", enabled = false },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        jedi_language_server = {
          on_attach = function(client, buffer)
            vim.api.nvim_exec([[setlocal completefunc=v:lua.MiniCompletion.completefunc_lsp ]], false)
          end,
        },
        pylsp = {
          on_attach = function(client, buffer)
            vim.api.nvim_exec([[setlocal completefunc=v:lua.MiniCompletion.completefunc_lsp ]], false)
          end,
        },
        clangd = {
          on_attach = function(client, buffer)
            vim.api.nvim_exec([[setlocal completefunc=v:lua.MiniCompletion.completefunc_lsp ]], false)
          end,
        },
      },
    },

    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- setup autoformat
      require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
      -- setup formatting and keymaps
      require("lazyvim.util").on_attach(function(client, buffer)
        require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)

      local servers = opts.servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          setup(server)
        end
      end
    end,
  },
}
