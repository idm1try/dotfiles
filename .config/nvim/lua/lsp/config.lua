local _lspconfig = pcall(require, "lspconfig")
local signs = require("utils").signs.filled

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or { { " ", "FloatBorder" } }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format {
                    filter = function(server)
                        return server.name == "null-ls" or server.name == "eslint"
                    end,
                    bufnr = bufnr,
                }
            end,
        })
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local _cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if _cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

if _lspconfig then
    local servers = {
        "bashls",
        "sumneko_lua",
        "cssls",
        "html",
        "emmet_ls",
        "jsonls",
        "yamlls",
        "dockerls",
        "sumneko_lua",
        "tsserver",
        "gopls",
        "eslint",
        "tailwindcss",
        "null_ls",
        "golangci_lint_ls",
    }

    for _, server in ipairs(servers) do
        require("lsp.servers." .. server).setup(on_attach, capabilities)
    end
end

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
    virtual_text = {
        source = "always",
        prefix = "ﱣ ",
        spacing = 6,
    },
    float = {
        header = false,
        source = "always",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
}
