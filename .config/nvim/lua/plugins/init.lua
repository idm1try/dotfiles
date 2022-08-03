local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
end
vim.cmd [[packadd packer.nvim]]

local _packer, packer = pcall(require, "packer")

if not _packer then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        prompt_border = "single",
        working_sym = "",
        error_sym = "",
        done_sym = "",
        removed_sym = "",
        header_sym = "",
    },
    git = {
        clone_timeout = 600,
    },
    auto_clean = true,
    compile_on_sync = true,
}

return packer.startup(function(use)
    use { "lewis6991/impatient.nvim" }
    use {
        "nathom/filetype.nvim",
        config = function()
            require "plugins.configs.filetype"
        end,
    }
    use { "wbthomason/packer.nvim" }

    -- UI
    use { "rmehri01/onenord.nvim" }
    use {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require "plugins.configs.devicons"
        end,
    }
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.0.0",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.configs.bufferline"
        end,
    }
    use { "folke/which-key.nvim" }
    use {
        "karb94/neoscroll.nvim",
        config = function()
            require "plugins.configs.neoscroll"
        end,
    }
    use {
        "feline-nvim/feline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.configs.feline"
        end,
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        run = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    }

    -- Utilities
    use {
        "kyazdani42/nvim-tree.lua",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.configs.nvimtree"
        end,
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-node-modules.nvim",
            "nvim-telescope/telescope-symbols.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = function()
            require "plugins.configs.telescope"
        end,
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "plugins.configs.indent"
        end,
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require "plugins.configs.autopairs"
        end,
    }
    use {
        "kylechui/nvim-surround",
        config = function()
            require "plugins.configs.surround"
        end,
    }
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require "plugins.configs.colorizer"
        end,
    }
    use { "gpanders/editorconfig.nvim" }
    use {
        "stevearc/dressing.nvim",
        config = function()
            require "plugins.configs.dressing"
        end,
    }
    use {
        "simrat39/symbols-outline.nvim",
        config = function()
            require "plugins.configs.symbols"
        end,
    }
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require "plugins.configs.project"
        end,
    }

    -- LSP
    use {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        requires = {
            "williamboman/mason.nvim",
        },
    }
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "folke/lua-dev.nvim",
            "jose-elias-alvarez/typescript.nvim",
        },
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    use {
        "j-hui/fidget.nvim",
        config = function()
            require "plugins.configs.fidget"
        end,
    }

    -- Comment
    use {
        "numToStr/Comment.nvim",
        config = function()
            require "plugins.configs.comment"
        end,
    }

    -- Completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = function()
            require "plugins.configs.cmp"
        end,
    }

    -- Snippets
    use { "rafamadriz/friendly-snippets" }

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require "plugins.configs.gitsigns"
        end,
    }
    use {
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require "plugins.configs.diffview"
        end,
    }

    -- Markdown
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = "markdown",
    }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
