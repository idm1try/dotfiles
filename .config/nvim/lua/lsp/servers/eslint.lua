local _M = {}

_M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.eslint.setup {
        root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        settings = {
            format = {
                enable = false,
            },
        },
        handlers = {
            ["window/showMessageRequest"] = function(_, result)
                if result.message:find "ENOENT" then
                    return vim.NIL
                end

                return vim.lsp.handlers["window/showMessageRequest"](nil, result)
            end,
        },
    }
end

return _M
