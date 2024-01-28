local map = vim.keymap.set
local utils = require("v.core.utils")

utils.cowboy()

map("n", "<leader>q", "<CMD>bd<CR>", { desc = "[buffer] close current" })
map("n", "<leader>Q", "<CMD>%bd|e#|bd#<CR>", { desc = "[buffer] close other" })

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "[search] clear" })

map("n", "<leader>p", "<cmd>:Lazy<cr>", { desc = "[lazy] open" })
