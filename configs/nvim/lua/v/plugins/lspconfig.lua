return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "nvimtools/none-ls.nvim",
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
          return string.format("%s ", diagnostic.message)
        end,
      },
      float = {
        source = false,
        header = "",
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

    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "[lsp] line diagnostic" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "[lsp] previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "[lsp] next diagnostic" })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[lsp] goto declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "[lsp] goto definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "[lsp] hover" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "[lsp] goto implementation" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "[lsp] signature help" })
        vim.keymap.set(
          "n",
          "<space>D",
          vim.lsp.buf.type_definition,
          { buffer = ev.buf, desc = "[lsp] show type definition" }
        )
        vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[lsp] rename" })
        vim.keymap.set("n", "<space>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[lsp] code actions" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "[lsp] references" })
        vim.keymap.set("n", "<space>lf", function()
          vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf, desc = "[lsp] format" })
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")

    require("neodev").setup()
    local servers = {
      nil_ls = {},
      rust_analyzer = {},
      taplo = {},
      lua_ls = {
        settings = {
          Lua = {
            format = { enable = false },
            completion = { callSnippet = "Replace" },
            workspace = { checkThirdParty = false },
          },
        },
      },
      tailwindcss = {
        root_dir = lspconfig.util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.cjs",
          "postcss.config.mjs",
          "postcss.config.ts"
        ),
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
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      },
    }

    for server, config in pairs(servers) do
      lspconfig[server].setup(Utils.merge_tables({
        on_attach,
        capabilities = capabilities,
      }, config))
    end

    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      save_after_format = true,
      sources = {
        formatting.dprint,
        formatting.stylua,
        formatting.taplo,
        formatting.nixfmt,
        formatting.rustfmt,

        code_actions.gitsigns,
      },
      on_attach = on_attach,
    })
  end,
}
