return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format()
      end,
      desc = "[lsp] format",
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { "dprint" },
      javascriptreact = { "dprint" },
      typescript = { "dprint" },
      typescriptreact = { "dprint" },
      json = { "dprint" },
      jsonc = { "dprint" },
      markdown = { "dprint" },
      fish = { "fish_indent" },
      lua = { "stylua" },
      nix = { "nixfmt" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
      dprint = {
        condition = function(ctx)
          return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    format_after_save = {
      lsp_fallback = true,
    },
  },
}
