vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- lua
    use {
        "lewis6991/impatient.nvim"
    }

    use {
        'nvim-lua/plenary.nvim',
        module = "plenary"
    }

    -- looks
    use {"C:\\Users\\OreoD\\AppData\\Local\\nvim\\lua\\plugin\\vim-gruvbox8",
        config = function()
            vim.cmd[[
            set background=dark
            colorscheme gruvbox8
            ]] end
    }

    use {
        "rebelot/kanagawa.nvim",
        opt = true,
        config = function()
            vim.cmd[[
                    set background=dark
                    colorscheme kanagawa
                    ]]
        end
    }

    use {'xiyaowong/nvim-transparent', config = function() require("plugin.transparent_config") end}

    use {"norcalli/nvim-colorizer.lua", event="BufReadPre", config=function() require'colorizer'.setup() end}

    use {
        'nvim-tree/nvim-web-devicons',
        module="nvim-web-devicons",
        config = function()
            require'nvim-web-devicons'.setup {
                color_icons = false;
            }
        end
    }

    use {
        'akinsho/bufferline.nvim', tag = "v3.*",
        config = function() require("plugin.bufferline_config") end,
        event={"BufCreate", "BufEnter"},
        opt=true
    }

    use {'glepnir/dashboard-nvim', config = function() require("plugin.dashboard_config") end}

    use {"folke/zen-mode.nvim", requires={
        {"folke/twilight.nvim", cmd="ZenMode"}
    },
        config = function() require("plugin.zen_mode_config") end, cmd="ZenMode",
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function() require("plugin.lualine_config") end,
        event={"BufCreate", "BufEnter"},
    }



    -- lang
        -- rust
    use {
        "rust-lang/rust.vim",
    }

        -- MD
    use {
        "ellisonleao/glow.nvim",
        cmd = {'Glow', 'Glow!'},
        config = function()
            require("plugin.glow_setup")
        end
    }

    -- utils

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
            }
        end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        cmd = "Telescope",
        keys = {"<C-p>", "<Leader>p"},
        requires = {"nvim-telescope/telescope-file-browser.nvim"},
        config = function() require("plugin.telescope_config") end,
    }

    use {
        "ntpeters/vim-better-whitespace",
    }

    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
            })
        end
    })

    use {
        "tpope/vim-fugitive",
        cmd = {'Git'}
    }
    use {
        "tpope/vim-repeat",
        keys = {"."},
    }
    use {
        "Raimondi/delimitMate",
        config = function() vim.cmd[[let delimitMate_expand_cr = 1]] end,
        event={"InsertEnter"}, opt=true,
    }
    use {
        "alvan/vim-closetag",
        ft = {"html", "xml", "xhtml", "phtml"}
    }

    use {"mg979/vim-visual-multi", keys = "<C-n>", opt=true,}

    use {
        "numToStr/Comment.nvim",
        keys = {"gc", "gb"},
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "ThePrimeagen/harpoon",
    }

    use {"tpope/vim-unimpaired"}

    use {"moll/vim-bbye", event="BufCreate"}

    use {"dhruvasagar/vim-zoom", keys = "<C-w>m"}

    -- motion
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        keys =  {'f', 'F', "t", "T"},
        cmd = {"HopWord", "HopLine", "HopPattern", "HopWordAC", "HopWordCurrentLine", "HopWordBC", "HopWordMW", "HopLineStart", "HopVertical", "HopChar1", "HopChar2"};
        config = function()
            require("plugin.hop_setup")
        end
    }

    -- Lsp/Snips

    use {"hrsh7th/vim-vsnip", requires = {
        "hrsh7th/cmp-vsnip", event="InsertEnter"
    }}

    use {"rafamadriz/friendly-snippets", event="InsertEnter"}

    use {"onsails/lspkind.nvim", opt=true}

        -- CMP
    use {"hrsh7th/nvim-cmp",
        requires = {
            {"hrsh7th/cmp-cmdline", opt=true},
            {"hrsh7th/cmp-path", opt=true},
            {"hrsh7th/cmp-buffer", opt=true},
            {"hrsh7th/cmp-nvim-lsp", opt=true},
        },
        event={"InsertEnter", "CmdlineEnter"},
        config = function()
            vim.cmd [[
                        PackerLoad lspkind.nvim cmp-cmdline cmp-path cmp-buffer cmp-nvim-lsp vim-vsnip friendly-snippets
                    ]]
            require("plugin.cmp_config")
        end
    }

        -- LSP
    use {
        "ray-x/lsp_signature.nvim",
        event="InsertEnter",
        config = function() require("plugin.lsp_sig_config") end,
    }

    use {'neovim/nvim-lspconfig', config=function() require("plugin.lsp_setup") end, requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }}

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', requires = {
        "nvim-treesitter/nvim-treesitter-context"
    }, config = function() require("plugin.treesitter_config") end }


    -- debug

    use {
        'mfussenegger/nvim-dap',
        config = function()
            require("plugin.debug")
        end
    }

    -- term

    use {'voldikss/vim-floaterm', cmd="FloatermNew"}
end)
