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
      end, { expr = true, desc = "[GIT] Next Hunk" })
      map("n", "[g", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "[GIT] Previous Hunk" })
      map({ "n", "v" }, "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "[GIT] Reset Hunk" })
      map("n", "<leader>gR", "<CMD>Gitsigns reset_buffer<CR>", { desc = "[GIT] Reset Buffer" })
      map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "[GIT] Undo Stage Hunk" })
      map("n", "<leader>gh", gs.preview_hunk, { desc = "[GIT] Preview Hunk" })
      map("n", "<leader>gd", gs.diffthis, { desc = "[GIT] Diff" })
    end,
  },
}
