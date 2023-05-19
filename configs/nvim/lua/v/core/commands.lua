local command = vim.api.nvim_create_user_command

command("Format", function()
  vim.lsp.buf.format({ async = true, timeout = 5000 })
end, {})

vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
