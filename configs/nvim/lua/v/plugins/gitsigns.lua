return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = " " },
    },
    current_line_blame = true,
    update_debounce = 150,
    status_formatter = nil,
    max_file_length = 40000,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map("n", "]g", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "[git] next hunk" })
      map("n", "[g", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "[git] previous hunk" })
      map({ "n", "v" }, "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "[git] reset hunk" })
      map("n", "<leader>gR", "<CMD>Gitsigns reset_buffer<CR>", { desc = "[git] reset buffer" })
      map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "[git] undo stage hunk" })
      map("n", "<leader>gh", gs.preview_hunk, { desc = "[git] preview hunk" })
      map("n", "<leader>gd", gs.diffthis, { desc = "[git] diff" })
    end,
  },
}
