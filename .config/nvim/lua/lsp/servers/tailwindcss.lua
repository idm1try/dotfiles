local _M = {}

_M.setup = function(on_attach, capabilities)
    require("lspconfig").tailwindcss.setup {
        root_dir = require("lspconfig").util.root_pattern(
            "tailwind.config.js",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.ts"
        ),
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end

return _M
