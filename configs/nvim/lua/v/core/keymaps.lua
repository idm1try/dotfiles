local map = vim.keymap.set

local function cowboy()
  ---@type table?
  local id
  local ok = true
  for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
    local count = 0
    local timer = assert(vim.loop.new_timer())
    local keymap = key
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= 10 then
        ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "🤠",
          replace = id,
          keep = function()
            return count >= 10
          end,
        })
        if not ok then
          id = nil
          return keymap
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
        return keymap
      end
    end, { expr = true, silent = true })
  end
end

cowboy()

map("n", "<leader>q", "<CMD>bd<CR>", { desc = "[buffer] close current" })
map("n", "<leader>Q", "<CMD>%bd|e#|bd#<CR>", { desc = "[buffer] close other" })

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "[search] clear" })

map("n", "<leader>p", "<cmd>:Lazy<cr>", { desc = "[lazy] open" })

map("n", "<leader>b", "<cmd>e ~/note.md<cr>", { desc = "[note] open" })
