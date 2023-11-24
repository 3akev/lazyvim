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

local function run_goal()
  local goal = get_goal()

  if goal == "" then
    vim.notify("No goal")
    return
  end
  local cmd = string.format("!echo -e '%s' | eclipserun '%s'", goal, vim.fn.expand("%:p"))
  local output = vim.fn.execute(cmd)
  output = sanitize_output(output)
  if vim.v.shell_error == 0 then
    vim.notify(output, vim.log.levels.INFO)
  else
    vim.notify(output, vim.log.levels.ERROR)
  end
end

local function run_goal_all_results()
  local goal = get_goal()

  if goal == "" then
    vim.notify("No goal")
    return
  end
  local cmd = string.format("!echo -e '%s' | eclipserun -a '%s'", goal, vim.fn.expand("%:p"))
  local output = vim.fn.execute(cmd)
  output = sanitize_output(output)
  if vim.v.shell_error == 0 then
    vim.notify(output, vim.log.levels.INFO)
  else
    vim.notify(output, vim.log.levels.ERROR)
  end
end

-- keybind run current line/selection as goal
vim.keymap.set({ "n", "v" }, "<localleader>r", run_goal, { desc = "Run goal" })
vim.keymap.set({ "n", "v" }, "<localleader>R", run_goal_all_results, { desc = "Run goal (all results)" })
