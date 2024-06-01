-- preview
vim.keymap.set("n", "<localleader>tp", ":TypstPreview<CR>")
vim.keymap.set("n", "<localleader>ts", ":TypstPreviewStop<CR>")
vim.keymap.set("n", "<localleader>tt", ":TypstPreviewToggle<CR>")

vim.cmd("set commentstring=//\\ %s")

require("mini.pairs").map_buf(0, "i", "$", { action = "closeopen", pair = "$$", neigh_pattern = "[^%a\\]." })
