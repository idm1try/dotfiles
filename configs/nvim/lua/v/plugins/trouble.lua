return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>tt", "<CMD>TroubleToggle<CR>", desc = "[TROUBLE] Toggle" },
    { "<leader>tw", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "[TROUBLE] Workspace diagnostics" },
    { "<leader>td", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "[TROUBLE] Document diagnostics" },
    { "<leader>tq", "<CMD>TroubleToggle quickfix<CR>", desc = "[TROUBLE] Quickfix" },
    { "<leader>tl", "<CMD>TroubleToggle locklist<CR>", desc = "[TROUBLE] Locklist" },
    { "gR", "<CMD>TroubleToggle lsp_references<CR>", desc = "[LSP] References" },
  },
  opts = { use_diagnostic_signs = true },
}
