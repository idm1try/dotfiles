return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
    "folke/neodev.nvim",
    "b0o/schemastore.nvim",

    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local Utils = require("v.core.utils")

    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    ---@diagnostic disable-next-line: duplicate-set-field
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border
        or {
          { " ", "FloatBorder" },
          { " ", "FloatBorder" },
          { " ", "FloatBorder" },
          { " ", "FloatBorder" },
          { " ", "FloatBorder" },
          { " ", "FloatBorder" },
          { " ", "FloatBorder" },
          { " ", "FloatBorder" },
        }
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    vim.diagnostic.config({
      virtual_text = {
        source = false,
        prefix = "▎",
        format = function(diagnostic)
          return string.format(
            "%s%s ",
            diagnostic.source and string.format("[%s]: ", string.upper(diagnostic.source)) or "",
            diagnostic.message
          )
        end,
      },
      float = {
        source = false,
        header = false,
        format = function(diagnostic)
          return string.format(
            "%s%s ",
            diagnostic.source and string.format("[%s]: ", diagnostic.source) or "",
            diagnostic.message
          )
        end,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ timeout = 2000, bufnr = bufnr })
          end,
        })
      end
    end

    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "[LSP] Line Diagnostic" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "[LSP] Previous Diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "[LSP] Next Diagnostic" })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[LSP] Goto Declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "[LSP] Goto Definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "[LSP] Hover" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "[LSP] Goto Implementation" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "[LSP] Signature Help" })
        vim.keymap.set(
          "n",
          "<space>D",
          vim.lsp.buf.type_definition,
          { buffer = ev.buf, desc = "[LSP] Show Type Definition" }
        )
        vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })
        vim.keymap.set("n", "<space>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[LSP] Code Actions" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "[LSP] References" })
        vim.keymap.set("n", "<space>lf", function()
          vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf, desc = "[LSP] Format" })
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")

    require("neodev").setup()
    local servers = {
      bashls = {
        cmd_env = {
          GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.zsh)",
        },
        filetypes = { "sh", "zsh" },
      },
      nil_ls = {},
      eslint = {
        root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
          on_attach(client, bufnr)
        end,
        settings = {
          format = {
            enable = false,
          },
        },
        handlers = {
          ["window/showMessageRequest"] = function(_, result)
            if result.message:find("ENOENT") then
              return vim.NIL
            end

            return vim.lsp.handlers["window/showMessageRequest"](nil, result)
          end,
        },
      },
      html = {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
          on_attach(client, bufnr)
        end,
      },
      jsonls = {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
          on_attach(client, bufnr)
        end,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
          },
        },
        init_options = {
          provideFormatter = true,
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            format = { enable = false },
            completion = { callSnippet = "Replace" },
            workspace = { checkThirdParty = false },
          },
        },
      },
      tailwindcss = {},
      tsserver = {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
          on_attach(client, bufnr)
        end,
        root_dir = lspconfig.util.root_pattern("package.json"),
        single_file_support = false,
        commands = {
          OrganizeImports = {
            function()
              vim.lsp.buf.execute_command({
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(0) },
                title = "Organize Imports",
              })
            end,
            description = "Organize Imports",
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
          },
        },
      },
    }

    for server, config in pairs(servers) do
      lspconfig[server].setup(Utils.merge_tables({
        on_attach,
        capabilities,
      }, config))
    end

    local include_root_file = function(...)
      local files = { ... }
      return function(utils)
        return utils.root_has_file(files)
      end
    end

    local exclude_root_file = function(...)
      local files = { ... }
      return function(utils)
        return not utils.root_has_file(files)
      end
    end

    local null_ls = require("null-ls")

    local _formatting = null_ls.builtins.formatting
    local _diagnostics = null_ls.builtins.diagnostics
    local _code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      save_after_format = true,
      sources = {
        _formatting.prettier.with({
          condition = exclude_root_file({ "dprint.json", ".dprint.json" }),
        }),
        _formatting.dprint.with({
          condition = include_root_file({ "dprint.json", ".dprint.json" }),
        }),
        _formatting.stylua,
        _formatting.taplo,
        _formatting.nixfmt,
        _formatting.shfmt.with({
          filetypes = { "sh", "bash", "zsh" },
        }),

        _code_actions.gitsigns,
      },
      on_attach = on_attach,
    })
  end,
}
