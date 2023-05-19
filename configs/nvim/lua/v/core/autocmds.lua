local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert!")
  end,
})

autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("ResizeSplit", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

autocmd({ "BufNewFile", "BufEnter" }, {
  pattern = { ".env", ".env.*", "*.env" },
  callback = function()
    vim.opt_local.filetype = "sh"
    vim.diagnostic.disable(0)
  end,
})
