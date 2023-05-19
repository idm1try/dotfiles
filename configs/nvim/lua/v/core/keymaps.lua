local map = vim.keymap.set

map("n", "<leader>q", "<CMD>bd<CR>", { desc = "[BUFFER] Close current buffer" })
map("n", "<leader>Q", "<CMD>%bd|e#|bd#<CR>", { desc = "[BUFFER] Close other buffers" })

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "[SEARCH] Clear" })

map("n", "<leader>p", "<cmd>:Lazy<cr>", { desc = "[LAZY] Open" })
