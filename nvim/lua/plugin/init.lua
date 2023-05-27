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

    use { "xiyaowong/nvim-transparent", config = function()
        require("transparent").setup({
            extra_groups = {},
            exclude_groups = {
                "FidgetTask",
                "FidgetTitle",
                "FloatShadow",
                "FloatShadowThrough",
            }, -- table: groups you don't want to clear
        })
    end }

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
    }

    use 'mhinz/vim-startify'

    use { 'norcalli/nvim-colorizer.lua', config = function()
        require 'colorizer'.setup()
    end }

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
        end,
    }

    -- Just
    use { "IndianBoy42/tree-sitter-just", config = function() require('tree-sitter-just').setup({}) end }

    -- Nu
    use {
        'LhKipp/nvim-nu',
        -- run =  ":TSInstall nu",
        config = function()
            require 'nu'.setup {
                use_lsp_features = false,
            }
        end
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
        config = function()
            require("plugin.hop_setup")
        end
    }

    use { "m4xshen/hardtime.nvim", config = function()
        require("hardtime").setup()
    end }

    -- Lsp/Snips

    use { 'simrat39/symbols-outline.nvim', config = function() require("symbols-outline").setup() end }

    use {

        "L3MON4D3/LuaSnip",
        requires = 'saadparwaiz1/cmp_luasnip',
    }

    use { "rafamadriz/friendly-snippets" }

    use { "onsails/lspkind.nvim" }

    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
        -- commit = "ccdeda9a100547ed65d10d63b05989af1e8e59e7",
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
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-nvim-lsp" },
            { 'j-hui/fidget.nvim' }
        },
        -- event = { "InsertEnter", "CmdlineEnter" },
        config = function()
            require("plugin.cmp_config")
            require "fidget".setup {
                window = {
                    relative = "editor", -- where to anchor, either "win" or "editor"
                    blend = 0,           -- &winblend for the window
                    zindex = nil,        -- the zindex value for the window
                    border = "single",   -- style of border for the fidget window
                },
            }
        end
    }

    -- LSP
    use {
        "ray-x/lsp_signature.nvim",
        -- event = "InsertEnter",
        config = function() require("plugin.lsp_sig_config") end,
    }

    use { 'VonHeikemen/lsp-zero.nvim', config = function() require("plugin.lsp_setup") end, requires = {
        'neovim/nvim-lspconfig',
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    } }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', config = function()
        require("plugin.treesitter_config")
    end }


    -- term

    use { 'voldikss/vim-floaterm', cmd = { "FloatermNew", "FloatermKill" }, config = function()
        vim.cmd [[
            hi FloatermBorder guibg=NONE guifg=orange
        ]]
    end }

    -- web
    use({
        "lalitmee/browse.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
            -- default values for the setup
            require('browse').setup({
                -- search provider you want to use
                provider = "google", -- duckduckgo, bing
                -- either pass it here or just pass the table to the functions
                -- see below for more
                bookmarks = {
                    ["rust"] = {
                        ["docs"] = "https://doc.rust-lang.org/book/",
                        ["docs crates"] = "https://docs.rs/",
                        ["crates"] = "https://crates.io/",
                        ["cheatsheet"] = "https://cheats.rs/",
                    },
                    ["draw.io"] = "https://app.diagrams.net/",
                    ["code"] = {
                        ["regex"] = {
                            ["cheatsheet"] = "https://quickref.me/regex",
                            ["test"] = "https://regex101.com/",
                        },
                        ["docs"] = "https://devdocs.io/",
                        ["stackoverflow"] = "https://stackoverflow.com/",
                        ["algorithms"] = "https://www.algorithm-archive.org/"
                    },
                    ["youtube"] = "https://youtube.com",
                    ["twitch"] = "https://twitch.tv",
                    ["github"] = {
                        "https://github.com",
                        ["code_search"] = "https://github.com/search?q=%s&type=code",
                        ["repo_search"] = "https://github.com/search?q=%s&type=repositories",
                        ["issues_search"] = "https://github.com/search?q=%s&type=issues",
                        ["pulls_search"] = "https://github.com/search?q=%s&type=pullrequests",
                    },
                }
            })
        end
    })
end)
