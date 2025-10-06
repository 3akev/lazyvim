local default_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = { "utf-8", "utf-16" },
}

vim.filetype.add({
  pattern = {
    [".*%.typ"] = "typst",
  },
})

local function typst_pin()
  local tinymist_id = nil
  for _, client in pairs(vim.lsp.get_clients()) do
    if client.name == "tinymist" then
      tinymist_id = client.id
      break
    end
  end

  if not tinymist_id then
    vim.notify("tinymist not running!", vim.log.levels.ERROR)
    return
  end

  local client = vim.lsp.get_client_by_id(tinymist_id)
  if client then
    client.request("workspace/executeCommand", {
      command = "tinymist.pinMain",
      arguments = { vim.api.nvim_buf_get_name(0) },
    }, function(err)
      if err then
        vim.notify("error pinning: " .. err, vim.log.levels.ERROR)
      else
        vim.notify("succesfully pinned", vim.log.levels.INFO)
      end
    end, 0)
  end
end

return {
  {
    "stevearc/conform.nvim",
    optional = true,

    opts = {
      formatters_by_ft = {
        typst = { "typstyle" },
      },
      formatters = {
        typstyle = { command = "typstyle" },
        -- typstfmt = { command = "typstfmt" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        tinymist = {
          -- Fix semantic highlighting stuff when using non-ascii characters
          offset_encoding = "utf-32",
          single_file_support = true,
          root_dir = function()
            return vim.fn.getcwd()
          end,
          settings = {
            -- formatterMode = "typstyle",
          },
          -- capabilities = default_capabilities,
        },
      },
    },
  },

  {
    "chomosuke/typst-preview.nvim",
    -- lazy = false,
    ft = "typst",
    -- version = "0.1.*",
    build = function()
      require("typst-preview").update()
    end,
    keys = {
      {
        "<localleader>tp",
        function()
          vim.cmd("TypstPreview")
          typst_pin()
        end,
        desc = "Start Typst preview",
        mode = { "n" },
      },
      {
        "<localleader>ts",
        ":TypstPreviewStop<CR>",
        desc = "Stop Typst preview",
        mode = { "n" },
      },
      {
        "<localleader>tt",
        function()
          vim.cmd("TypstPreviewToggle")
          typst_pin()
        end,
        desc = "Toggle Typst preview",
        mode = { "n" },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      -- ensure_installed = {
      --   "tinymist",
      -- },
    },
  },
}
