local filetype = require "filetype"

local function set_indent_size(size)
    vim.bo.shiftwidth = size
    vim.bo.tabstop = size
    vim.bo.softtabstop = size
end

filetype.setup {
    overrides = {
        function_extensions = {
            ["lua"] = function()
                vim.bo.filetype = "lua"
                set_indent_size(4)
            end,
            ["go"] = function()
                vim.bo.filetype = "go"
                set_indent_size(4)
            end,
        },
        function_complex = {
            ["[tj]sconfig.*.json"] = function()
                vim.bo.filetype = "jsonc"
            end,
        },
    },
}
