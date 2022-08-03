local _M = {}

_M.setup = function(on_attach, capabilities)
    local config = require("lua-dev").setup {
        lspconfig = {
            on_attach = on_attach,
            settings = {
                prefer_null_ls = true,
                Lua = {
                    format = {
                        enable = false,
                    },
                    diagnostics = {
                        enable = true,
                        globals = {
                            "vim",
                            "use",
                            "describe",
                            "it",
                            "assert",
                            "before_each",
                            "after_each",
                        },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
            flags = {
                debounce_text_changes = 150,
            },
            capabilities = capabilities,
        },
    }
    require("lspconfig").sumneko_lua.setup(config)
end

return _M
