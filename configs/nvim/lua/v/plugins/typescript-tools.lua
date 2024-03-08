return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    { "dmmulroy/ts-error-translator.nvim", config = true },
  },
  event = "VeryLazy",
  keys = {
    { "<leader>tg", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "[typescript] goto source definition" },
    { "<leader>to", "<cmd>TSToolsOrganizeImports<cr>", desc = "[typescript] organize imports" },
    { "<leader>ts", "<cmd>TSToolsSortImports<cr>", desc = "[typescript] sort imports" },
    { "<leader>tr", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "[typescript] remove unused imports" },
    { "<leader>ta", "<cmd>TSToolsAddMissingImports<cr>", desc = "[typescript] add missing imports" },
    { "<leader>tf", "<cmd>TSToolsFixAll<cr>", desc = "[typescript] fix all" },
  },
  opts = {
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  },
}
