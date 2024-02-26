-- very magic mode enabled by default in command line
-- do not use silent in command mode, it delays rhs key input until the next key
vim.keymap.set("n", "/", [[/\v]], { noremap = true })
vim.keymap.set("n", "?", [[?\v]], { noremap = true })
local function enable_very_magic()
  local cmdline, cmdtype = vim.fn.getcmdline(), vim.fn.getcmdtype()
  if cmdtype ~= ":" then
    return "/"
  end
  -- list of valid command-line inputs that trigger very magic mode
  local valid_values = { "s", [['<,'>s]], "%s", "g", [['<,'>g]], "g!", [['<,'>g!]] }
  if vim.tbl_contains(valid_values, cmdline) then
    return "/\\v"
  elseif cmdline == "v" then
    return [[imgrep /\v/ **/*]] .. string.rep("<Left>", 6)
  elseif cmdline == "vext" then
    -- for "vext/" command, grep over current file extension
    local current_extension = vim.fn.expand("%:e")
    vim.fn.setcmdline("vimgrep /\\v/ **/*." .. current_extension, 12)
    return
  elseif string.match(cmdline, "^vext:") then
    -- for "vext:ext1,ext2,ext3/" command, grep over specified extensions
    local extensions = string.sub(cmdline, 6, -1) -- extract extensions from the command
    vim.fn.setcmdline("vimgrep /\\v/ **/*.{" .. extensions .. ",}", 12)
    return
  end
  return "/"
end
vim.keymap.set("c", "/", enable_very_magic, { noremap = true, expr = true })
