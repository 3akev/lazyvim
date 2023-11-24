local function sanitize_output(output)
  output = output.gsub(output, "^[:][!].*$", "")
  output = output.gsub(output, "shell returned %d", "")
  output = output.gsub(output, "^\n+", "")
  output = output.gsub(output, "\n+$", "")
  output = output.gsub(output, "\n+", "\n")
  local _, pos = string.find(output, "\n")
  if pos ~= nil then
    return output.sub(output, pos + 1)
  else
    return output
  end
end

local function get_goal()
  local b = vim.fn.line("v")
  local e = vim.fn.line(".")

  if b > e then
    b, e = e, b
  end

  local goal = ""
  if b == e then
    goal = vim.fn.getline(b)
  else
    for _, line in ipairs(vim.fn.getline(b, e)) do
      if line ~= "" then
        goal = goal .. line .. "\\n"
      end
    end
    if goal.len(goal) > 0 then
      goal = goal.sub(goal, 1, goal.len(goal) - 2)
    end
  end

  return goal
end

local function _run_eclipse(options)
  local goal = get_goal()

  if goal == "" then
    vim.notify("No goal", vim.log.levels.ERROR)
    return
  end
  local cmd = string.format("!echo -e '%s' | eclipserun %s '%s'", goal, options, vim.fn.expand("%:p"))
  local output = vim.fn.execute(cmd)
  output = sanitize_output(output)
  if vim.v.shell_error == 0 then
    vim.notify(output, vim.log.levels.INFO)
  else
    vim.notify(output, vim.log.levels.ERROR)
  end
end

local function _run_eclipse_trace()
  local goal = get_goal()

  if goal == "" then
    vim.notify("No goal", vim.log.levels.ERROR)
    return
  end

  local file = vim.fn.expand("%:p")

  vim.cmd("split")
  vim.cmd("resize -12")
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(win, buf)
  vim.fn.termopen("eclipse")
  vim.api.nvim_put({
    string.format("['%s'].", file),
    "trace.",
    goal,
    "",
  }, "l", true, true)
  vim.fn.wait(150, false)
  vim.cmd("startinsert")
end

-- keybind run current line/selection as goal
vim.keymap.set({ "n", "v" }, "<localleader>r", function()
  _run_eclipse("")
end, { desc = "Run goal" })

vim.keymap.set({ "n", "v" }, "<localleader>R", function()
  _run_eclipse("-a")
end, { desc = "Run goal (all results)" })

vim.keymap.set({ "n", "v" }, "<localleader>t", function()
  _run_eclipse_trace()
end, { desc = "Run goal (trace)" })
