vim.cmd("setlocal shiftwidth=4")

-- -- eclipserun stuff
-- vim.keymap.set({ "n", "v" }, "<localleader>r", function()
--   eclipserun("")
-- end, { desc = "Run goal" })
--
-- vim.keymap.set({ "n", "v" }, "<localleader>R", function()
--   eclipserun("--all")
-- end, { desc = "Run goal (all results)" })
--
-- -- built in stuff
-- vim.keymap.set({ "n", "v" }, "<localleader>t", function()
--   run_eclipse_in_terminal("trace.")
-- end, { desc = "Run goal in terminal (trace)" })
--
-- vim.keymap.set({ "n", "v" }, "<localleader>e", function()
--   run_eclipse_in_terminal("")
-- end, { desc = "Run goal in terminal" })
