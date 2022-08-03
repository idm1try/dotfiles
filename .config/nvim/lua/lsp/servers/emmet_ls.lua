local _M = {}

_M.setup = function(on_attach, capabilities)
    require("lspconfig").emmet_ls.setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
        filetypes = { "html" },
    }
end

return _M
