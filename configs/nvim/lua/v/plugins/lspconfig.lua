return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")

    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    ---@diagnostic disable-next-line: duplicate-set-field
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = {
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
          return string.format("%s ", diagnostic.message)
        end,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "[lsp] line diagnostic" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "[lsp] previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "[lsp] next diagnostic" })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[lsp] goto declaration" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "[lsp] hover" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "[lsp] signature help" })
        vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[lsp] rename" })
        vim.keymap.set("n", "<space>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[lsp] code actions" })
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
    })

    lspconfig.nil_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    lspconfig.html.setup({
      capabilities = capabilities,
    })

    lspconfig.yamlls.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          format = { enable = false },
          completion = { callSnippet = "Replace" },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
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
    })

    lspconfig.jsonls.setup({
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      init_options = {
        provideFormatter = true,
      },
    })
  end,
}
