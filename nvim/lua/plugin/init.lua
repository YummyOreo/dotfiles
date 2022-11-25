vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'
        use {
                "lewis6991/impatient.nvim"
        }

        use {
                'nvim-lua/plenary.nvim',
                module = "plenary"
        }

        use {
                "rust-lang/rust.vim",
                ft = {"rs", "rust"},
                cmd={"RustFmt", "RustRun", "RustInfo", "RustPlay", "RustTest", "RustEmitIr", "RustExpand", "RustEmitAsm", "RustInfoToFile", "RustInfoToClipboard"}
        }

        use {"easymotion/vim-easymotion", event="BufReadPre", opt=true,}

        use {"lifepillar/vim-gruvbox8",
        config = function() vim.cmd[[
                set background=dark
                colorscheme gruvbox8
        ]] end
        }

        use {'akinsho/bufferline.nvim', tag = "v3.*", config = function() require("plugin.bufferline_config") end, event={"BufCreate", "BufEnter"}, opt=true}
	use {"norcalli/nvim-colorizer.lua"}

        use {"hrsh7th/vim-vsnip", requires = {
                "hrsh7th/cmp-vsnip", event="InsertEnter"
        }}

        use "rafamadriz/friendly-snippets"

        use {"hrsh7th/nvim-cmp",
                requires = {
                        {"hrsh7th/cmp-cmdline"},
                        {"hrsh7th/cmp-path"},
                        {"hrsh7th/cmp-buffer"},
                        {"hrsh7th/cmp-nvim-lsp"},
                        {"onsails/lspkind.nvim"}
                },
                event="InsertEnter",
                config = function() require("plugin.cmp_config") end
        }

        use {
          "ray-x/lsp_signature.nvim",
          event="InsertEnter",
          config = function() require("plugin.lsp_sig_config") end,
        }

        use {'neovim/nvim-lspconfig', config=function() require("plugin.lsp_setup") end, requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
        }}

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0',
		cmd = "Telescope",
                requires = "nvim-telescope/telescope-file-browser.nvim",
                config = function() require("plugin.telescope_config") end,
        }

        use {'glepnir/dashboard-nvim', config = function() require("plugin.dashboard_config") end}

        use { 'nvim-treesitter/nvim-treesitter', requires = {
                "nvim-treesitter/nvim-treesitter-context"
        }, config = function() require("plugin.treesitter_config") end }

        use {"folke/zen-mode.nvim", requires={
                {"folke/twilight.nvim", cmd="ZenMode"}
        },
        config = function() require("plugin.zen_mode_config") end, cmd="ZenMode",
        }

        use {
          'nvim-lualine/lualine.nvim',
          config = function() require("plugin.lualine_config") end,
          event={"BufCreate", "BufEnter"},
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        use {'xiyaowong/nvim-transparent', config = function() require("plugin.transparent_config") end}

        use {
                "ntpeters/vim-better-whitespace",
                event="BufReadPre", opt=true,
        }
        use {
                "tpope/vim-surround",
                event="BufReadPre", opt=true,
        }
        use {
                "tpope/vim-fugitive",
                cmd = {'Git'}
        }
        use {
                "tpope/vim-repeat",
                keys = {"."}
        }
        use {
                "Raimondi/delimitMate",
                config = function() vim.cmd[[let delimitMate_expand_cr = 1]] end,
                event="BufReadPre", opt=true,
        }
        use {
                "alvan/vim-closetag",
                ft = {"html", "xml", "xhtml", "phtml"}
        }
        use {"mg979/vim-visual-multi", keys = "<C-n>", opt=true,}
        use 'wakatime/vim-wakatime'
        use {
                "tpope/vim-commentary",
                keys = {"gc", "gcc"}
        }
        use {
                "ThePrimeagen/harpoon",
        }

        use {"AaronLasseigne/yank-code", keys = "<Leader>y"}
        use {"tpope/vim-unimpaired"}
        use {"moll/vim-bbye", cmd=":Bdelete"}
        use {"dhruvasagar/vim-zoom", keys = "<C-w>m"}
end)
