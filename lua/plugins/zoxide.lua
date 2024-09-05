local function zoxide_jump()
  require("fzf-lua").fzf_live("zoxide query --list --score <query>", {
    prompt = "Directories> ",
    actions = {
      ["default"] = function(selected)
        local idx = string.find(selected[1], "/")
        local dir = string.sub(selected[1], idx)
        vim.cmd("cd " .. dir)
        vim.notify(dir)
      end,
    },
    fn_transform = function(x)
      return require("fzf-lua").make_entry.file(x, { file_icons = true, color_icons = true })
    end,
  })
end

return {
  -- zoxide change dir with fzf-lua
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>z", zoxide_jump, "n", desc = "Change directory with zoxide" },
    },
  },
}
