local _M = {}

_M.setup = function(on_attach, capabilities)
    require("lspconfig").bashls.setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end

return _M
