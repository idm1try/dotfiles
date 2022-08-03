local ok, null_ls = pcall(require, "null-ls")

if not ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local _M = {}

_M.setup = function(on_attach)
    null_ls.setup {
        sources = {
            diagnostics.hadolint,
            diagnostics.tidy,
            diagnostics.luacheck,
            diagnostics.markdownlint,

            formatting.prettierd,
            formatting.stylua,
            formatting.gofumpt,
            formatting.shfmt.with {
                filetypes = { "sh", "bash", "zsh" },
            },
        },
        on_attach = on_attach,
    }
end

return _M
