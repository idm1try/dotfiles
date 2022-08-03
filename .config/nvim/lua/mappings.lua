local _wk, wk = pcall(require, "which-key")

if not _wk then
    return
end

local opts = {
    mode = "n",
    prefix = "",
    silent = true,
    noremap = true,
    nowait = true,
}

wk.register({
    ["<leader>]"] = { "<cmd>bn<cr>", "[BUFFER] Go previous buffer" },
    ["<leader>["] = { "<cmd>bp<cr>", "[BUFFER] Go next buffer" },
    ["<leader>q"] = { "<cmd>bd<cr>", "[BUFFER] Close current buffer" },
    ["<leader>Q"] = { "<cmd>%bd|e#|bd#<cr>", "[BUFFER] Close other buffers" },

    ["<leader>n"] = { "<cmd>e ~/Documents/note.md<cr>", "[NOTE] Edit" },
    ["<leader>m"] = { "<cmd>MarkdownPreviewToggle<CR>", "[MARKDOWN] Preview" },

    ["<c-n>"] = { "<cmd>NvimTreeToggle<cr> <cmd>NvimTreeRefresh<cr>", "[NVIMTREE] Toggle" },

    ["<leader>f"] = {
        name = "[TELESCOPE]",
        f = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "[TELESCOPE] Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "[TELESCOPE] Recents" },
        g = { "<cmd>Telescope live_grep<cr>", "[TELESCOPE] Find File by grep" },
        b = { "<cmd>Telescope buffers<cr>", "[TELESCOPE] Find buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "[TELESCOPE] Help tags" },
        m = { "<cmd>Telescope man_pages<cr>", "[TELESCOPE] Man pages" },
        p = { "<cmd>Telescope projects<cr>", "[TELESCOPE] Find projects" },
        n = { "<cmd>Telescope node_modules list<cr>", "[TELESCOPE] node_modules" },
        d = { "<cmd>Telescope diagnostics<cr>", "[TELESCOPE] Diagnostics" },
        s = { "<cmd>Telescope symbols<cr>", "[TELESCOPE] Symbols" },
    },

    ["<leader>g"] = {
        name = "[GIT]",
        s = { "<cmd>Gitsigns toggle_signs<cr>", "[GIT] Toggle signs" },
        h = { "<cmd>Gitsigns preview_hunk<cr>", "[GIT] Preview hunk" },
        d = { "<cmd>Gitsigns diffthis<cr>", "[GIT] Diff" },
        n = { "<cmd>Gitsigns next_hunk<cr>", "[GIT] Next hunk" },
        p = { "<cmd>Gitsigns prev_hunk<cr>", "[GIT] Prev hunk" },
        f = { "<cmd>Telescope git_status<cr>", "[GIT] Files Status" },
        c = { "<cmd>Telescope git_commits<cr>", "[GIT] Commits" },
        b = { "<cmd>Telescope git_branches<cr>", "[GIT] Branches" },
    },

    ["<leader>l"] = {
        name = "[LSP]",
        l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "[LSP] Open float" },
        n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "[LSP] Diagnostic jump next" },
        p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "[LSP] Diagnostic jump previous" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "[LSP] Format" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "[LSP] Preview definition" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "[LSP] Hover doc" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "[LSP] Signature help" },
        c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "[LSP] Code Action" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "[LSP] Rename" },
    },

    ["<leader>t"] = {
        name = "[TYPESCRIPT]",
        r = { "<cmd>TypescriptRemoveUnused<cr>", "[TYPESCRIPT] Remove unused" },
        o = { "<cmd>TypescriptOrganizeImports<cr>", "[TYPESCRIPT] Organize imports" },
        a = { "<cmd>TypescriptAddMissingImports<cr>", "[TYPESCRIPT] Add missing imports" },
        x = { "<cmd>TypescriptFixAll<cr>", "[TYPESCRIPT] Fix All" },
        n = { "<cmd>TypescriptRenameFile<cr>", "[TYPESCRIPT] Rename file" },
    },

    ["<esc>"] = { "<cmd>noh<cr>", "[SEARCH] No highlight" },
    ["<leader>c"] = { "<cmd>ColorizerToggle<cr>", "[COLORIZER] Toggle" },
    ["<leader>s"] = { "<cmd>SymbolsOutline<cr>", "[SYMBOL] Toggle" },

    ["<c-h>"] = { "<cmd>wincmd h<cr>", "" },
    ["<c-j>"] = { "<cmd>wincmd j<cr>", "" },
    ["<c-k>"] = { "<cmd>wincmd k<cr>", "" },
    ["<c-l>"] = { "<cmd>wincmd l<cr>", "" },

    ["<s-k>"] = { "<cmd>resize -1<cr>", "[BUFFER] Resize up" },
    ["<s-j>"] = { "<cmd>resize +2<cr>", "[BUFFER] Resize down" },
    ["<s-h>"] = { "<cmd>vertical resize -1<cr>", "[BUFFER] Resize left" },
    ["<s-l>"] = { "<cmd>vertical resize +1<cr>", "[BUFFER] Resize right" },
}, opts)

wk.setup {}

local function hard_mode() end

vim.keymap.set("n", "<Up>", hard_mode)
vim.keymap.set("n", "<Down>", hard_mode)
vim.keymap.set("n", "<Left>", hard_mode)
vim.keymap.set("n", "<Right>", hard_mode)

vim.keymap.set("i", "<Up>", hard_mode)
vim.keymap.set("i", "<Down>", hard_mode)
vim.keymap.set("i", "<Left>", hard_mode)
vim.keymap.set("i", "<Right>", hard_mode)

vim.keymap.set("v", "<Up>", hard_mode)
vim.keymap.set("v", "<Down>", hard_mode)
vim.keymap.set("v", "<Left>", hard_mode)
vim.keymap.set("v", "<Right>", hard_mode)
