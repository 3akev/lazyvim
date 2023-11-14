return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "json",
        "lua",
        "python",
        "regex",
        "vim",
        "yaml",
        "c",
        "r",
        "java",
        "javascript",
        "html",
        "fish",
        "dot",
        "cpp",
        "cmake",
        "gdscript",
        "latex",
        "make",
        "ruby",
        "sql",
        "toml",
      },
    },
  },
}
