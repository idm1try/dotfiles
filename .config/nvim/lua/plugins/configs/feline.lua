local feline = require "feline"
local lsp = require "feline.providers.lsp"
local vi_mode_utils = require "feline.providers.vi_mode"
local git_utils = require "feline.providers.git"
local colors = require("colorscheme").colors
local signs = require("utils").signs.filled
local powerline = require("utils").powerline.triangle

local conditions = {
    diagnostic_enable = function(type)
        return lsp.get_diagnostics_count(type) ~= 0
    end,
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
        return vim.opt.columns:get() > 150
    end,
}

local components = {
    vi_mode = {
        sep = {
            left = {
                provider = " ",
                hl = function()
                    return {
                        name = vi_mode_utils.get_mode_highlight_name(),
                        bg = vi_mode_utils.get_mode_color(),
                    }
                end,
            },
            right = {
                provider = " ",
                hl = function()
                    return {
                        name = vi_mode_utils.get_mode_highlight_name(),
                        bg = vi_mode_utils.get_mode_color(),
                    }
                end,
            },
        },
        text = {
            provider = function()
                return vi_mode_utils.get_vim_mode() .. " "
            end,
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color(),
                    bg = colors.bg4,
                    style = "bold",
                }
            end,
            left_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },

            right_sep = powerline.right,
        },
    },
    file = {
        info = {
            provider = {
                name = "file_info",
                opts = {
                    file_readonly_icon = " ",
                },
            },
            left_sep = " ",
            right_sep = " ",
            hl = {
                style = "bold",
            },
            enabled = conditions.buffer_not_empty,
        },
        encoding = {
            provider = "file_encoding",
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
        type = {
            provider = "file_type",
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
        os = {
            provider = function()
                local os = vim.opt.fileformat:get()
                if os == "unix" then
                    return "LF"
                elseif os == "mac" then
                    return "CR"
                else
                    return "CRLF"
                end
            end,
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
        indent_size = {
            icon = "ﲒ ",
            provider = function()
                return tostring(vim.opt.tabstop:get())
            end,
            left_sep = " ",
            right_sep = " ",
            enabled = conditions.buffer_not_empty,
        },
        size = {
            provider = "file_size",
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
        position = {
            provider = "position",
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
    },
    line_percentage = {
        provider = "line_percentage",
        left_sep = " ",
        right_sep = " ",
        enabled = function()
            return conditions.buffer_not_empty() and conditions.hide_in_width()
        end,
    },
    lsp = {
        names = {
            provider = function()
                local clients = {}

                for _, client in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
                    if client.name ~= "null-ls" then
                        clients[#clients + 1] = client.name
                    end
                end

                return table.concat(clients, " ")
            end,
            left_sep = " ",
            right_sep = " ",
            icon = " ",
            enabled = conditions.buffer_not_empty,
        },
        diagnostics = {
            error = {
                provider = function()
                    return tostring(lsp.get_diagnostics_count "Error")
                end,
                icon = signs.Error .. " ",
                right_sep = " ",
                enabled = function()
                    return conditions.diagnostic_enable "Error"
                end,
                hl = {
                    fg = colors.red,
                },
            },
            warn = {
                provider = function()
                    return tostring(lsp.get_diagnostics_count "Warn")
                end,
                icon = signs.Warn .. " ",
                right_sep = " ",
                enabled = function()
                    return conditions.diagnostic_enable "Warn"
                end,
                hl = {
                    fg = colors.orange,
                },
            },
            info = {
                provider = function()
                    return tostring(lsp.get_diagnostics_count "Info")
                end,
                icon = signs.Info .. " ",
                right_sep = " ",
                enabled = function()
                    return conditions.diagnostic_enable "Info"
                end,
                hl = {
                    fg = colors.green,
                },
            },
            hint = {
                provider = function()
                    return tostring(lsp.get_diagnostics_count "Hint")
                end,
                icon = signs.Hint .. " ",
                right_sep = " ",
                enabled = function()
                    return conditions.diagnostic_enable "Hint"
                end,
                hl = {
                    fg = colors.magenta,
                },
            },
        },
    },
    git = {
        branch = {
            provider = "git_branch",
            icon = " ",
            hl = {
                fg = colors.magenta,
                bg = colors.bg4,
                style = "bold",
            },
            left_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
            right_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
        },
        add = {
            provider = "git_diff_added",
            hl = {
                fg = colors.green,
                bg = colors.bg4,
            },
            icon = "洛",
            right_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
        },
        change = {
            provider = "git_diff_changed",
            hl = {
                fg = colors.orange,
                bg = colors.bg4,
            },
            icon = " ",
            right_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
        },
        remove = {
            provider = "git_diff_removed",
            hl = {
                fg = colors.red,
                bg = colors.bg4,
            },
            icon = " ",
            right_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
        },
    },
    powerline = {
        left = {
            provider = function()
                if git_utils.git_info_exists() then
                    return powerline.left
                else
                    return ""
                end
            end,
            hl = {
                fg = colors.bg4,
            },
        },
    },
}

feline.setup {
    theme = {
        fg = colors.bg0,
        bg = colors.bg3,
    },
    highlight_reset_triggers = {},
    force_inactive = {
        {
            filetypes = {
                "^packer$",
                "^startify$",
                "^fugitive$",
                "^fugitiveblame$",
                "^qf$",
                "^help$",
            },
            buftypes = {
                "^terminal$",
            },
            bufnames = {},
        },
    },
    components = {
        active = {
            {
                components.vi_mode.sep.left,
                components.vi_mode.text,
                components.file.info,
                components.file.type,
                components.file.size,
                components.line_percentage,
                components.file.position,
            },
            {
                components.lsp.names,
                components.lsp.diagnostics.error,
                components.lsp.diagnostics.warn,
                components.lsp.diagnostics.hint,
                components.lsp.diagnostics.info,
                components.file.os,
                components.file.encoding,
                components.file.indent_size,
                components.powerline.left,
                components.git.branch,
                components.git.add,
                components.git.change,
                components.git.remove,
                components.vi_mode.sep.right,
            },
        },
        inactive = {},
    },
    vi_mode_colors = {
        NORMAL = colors.cyan,
        INSERT = colors.green,
        VISUAL = colors.magenta,
        LINES = colors.magenta,
        OP = colors.green,
        BLOCK = colors.blue,
        REPLACE = colors.orange,
        ["V-REPLACE"] = colors.orange,
        ENTER = colors.cyan,
        MORE = colors.cyan,
        SELECT = colors.yellow,
        COMMAND = colors.green,
        SHELL = colors.red,
        TERM = colors.red,
        NONE = colors.yellow,
    },
}
