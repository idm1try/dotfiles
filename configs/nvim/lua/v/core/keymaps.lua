local map = vim.keymap.set

map("n", "<leader>q", "<CMD>bd<CR>", { desc = "[buffer] close current" })
map("n", "<leader>Q", "<CMD>%bd|e#|bd#<CR>", { desc = "[buffer] close other" })

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "[search] clear" })

map("n", "<leader>p", "<cmd>:Lazy<cr>", { desc = "[lazy] open" })

map("n", "<leader>b", "<cmd>e ~/notes/note.md<cr>", { desc = "[note] open" })
