vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'wakatime/vim-wakatime'

    -- lua
    use {
        "lewis6991/impatient.nvim"
    }

    use {
        'nvim-lua/plenary.nvim',
        module = "plenary"
    }

    -- looks
    use { "lifepillar/vim-gruvbox8",
        config = function()
            vim.cmd [[
            let g:gruvbox_filetype_hi_groups = 1
            let g:gruvbox_plugin_hi_groups = 1
            let g:gruvbox_italics = 0
            let g:gruvbox_bold = 1
            set background=dark
            colorscheme gruvbox8
            ]]
        end
    }

    use {
        'nvim-tree/nvim-web-devicons',
        module = "nvim-web-devicons",
        config = function()
            require 'nvim-web-devicons'.setup {
            }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function() require("plugin.lualine_config") end,
        event = { "BufCreate", "BufEnter" },
    }

    use 'mhinz/vim-startify'

    -- lang
    -- rust
    use "rust-lang/rust.vim"

    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        event = { "BufRead Cargo.toml" },
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
            vim.api.nvim_set_keymap("n", "<leader>cu", "<cmd> lua require('crates').upgrade_all_crates()<cr>",
                { noremap = true })
        end,
    }

    -- utils

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { "nvim-telescope/telescope-file-browser.nvim" },
        config = function() require("plugin.telescope_config") end,
    }

    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
            })
        end
    })

    use { 'nacro90/numb.nvim', config = function() require('numb').setup() end }

    use {
        "Raimondi/delimitMate",
        config = function() vim.cmd [[let delimitMate_expand_cr = 1]] end,
        event = { "InsertEnter" }, opt = true,
    }

    use {
        "numToStr/Comment.nvim",
        keys = { "gc", "gb" },
        config = function()
            require('Comment').setup()
        end
    }

    use {
        "ThePrimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")


            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
        end
    }

    use { "tpope/vim-unimpaired" }

    -- motion
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        cmd = { "HopWord", "HopLine", "HopPattern", "HopWordAC", "HopWordCurrentLine", "HopWordBC", "HopWordMW",
            "HopLineStart", "HopVertical", "HopChar1", "HopChar2" };
        config = function()
            require("plugin.hop_setup")
        end
    }

    -- Lsp/Snips

    use { 'simrat39/symbols-outline.nvim', config = function() require("symbols-outline").setup() end }

    use {

        "hrsh7th/vim-vsnip",
        requires = 'hrsh7th/cmp-vsnip',
        opt = true,
    }

    use { "rafamadriz/friendly-snippets", opt = true }

    use { "onsails/lspkind.nvim", opt = true }

    use {
        "glepnir/lspsaga.nvim",
        -- branch = "main",
        commit = "ccdeda9a100547ed65d10d63b05989af1e8e59e7",
        config = function()
            require('lspsaga').setup({
                ui = {
                    colors = {
                        --float window normal background color
                        normal_bg = '#32302f',
                        --title background color
                        title_bg = '#ebdbb2',
                        red = '#cc241d',
                        magenta = '#d79921',
                        orange = '#d65d0e',
                        yellow = '#d79921',
                        green = '#98971a',
                        cyan = '#83a598',
                        blue = '#458588',
                        purple = '#d79921',
                        white = '#ebdbb2',
                        black = '#1d2021',
                    },
                },
            })
            vim.cmd [[
            hi! LspSagaWinbarSep guifg=#ebdbb2
            ]]
        end,
    }

    -- CMP
    use { "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-cmdline", opt = true },
            { "hrsh7th/cmp-path", opt = true },
            { "hrsh7th/cmp-buffer", opt = true },
            { "hrsh7th/cmp-nvim-lsp", opt = true },
            { 'j-hui/fidget.nvim', opt = true }
        },
        event = { "InsertEnter", "CmdlineEnter" },
        config = function()
            vim.cmd [[
                        PackerLoad lspkind.nvim cmp-cmdline cmp-path cmp-buffer vim-vsnip cmp-nvim-lsp friendly-snippets fidget.nvim
                    ]]
            require "fidget".setup {}
            require("plugin.cmp_config")
        end
    }

    -- LSP
    use {
        "ray-x/lsp_signature.nvim",
        -- event = "InsertEnter",
        config = function() require("plugin.lsp_sig_config") end,
    }

    use { 'neovim/nvim-lspconfig', config = function() require("plugin.lsp_setup") end, requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    } }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', config = function()
        require("plugin.treesitter_config")
    end }


    -- term

    use { 'voldikss/vim-floaterm', cmd = { "FloatermNew", "FloatermKill" } }

end)
