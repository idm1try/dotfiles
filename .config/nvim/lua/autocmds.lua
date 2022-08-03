local autocmd = vim.api.nvim_create_autocmd
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
})

autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

autocmd("BufRead", {
    callback = function()
        vim.api.nvim_create_autocmd("BufWinEnter", {
            once = true,
            command = "normal! zx",
        })
    end,
})
