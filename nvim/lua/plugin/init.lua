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
                -- ft = {"rs", "rust"},
                -- cmd={"RustFmt", "RustRun", "RustInfo", "RustPlay", "RustTest", "RustEmitIr", "RustExpand", "RustEmitAsm", "RustInfoToFile", "RustInfoToClipboard"},
                config = function()
                  vim.api.nvim_set_keymap("n", "<Leader>f", ":RustFmt", { noremap = true, silent = true })
                end,
        }

        -- use {"easymotion/vim-easymotion", event="BufReadPre", opt=true,}
        use {
          'phaazon/hop.nvim',
          branch = 'v2', -- optional but strongly recommended
          keys =  {'f', 'F', "t", "T"},
          cmd = {"HopWord", "HopLine", "HopPattern", "HopWordAC", "HopWordCurrentLine", "HopWordBC", "HopWordMW", "HopLineStart", "HopVertical", "HopChar1", "HopChar2"};
          config = function()
            require'hop'.setup { keys = 'aoeuidhtnspyfgcrlqjkxbmwvz' }
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection
            vim.keymap.set('', 'f', function()
              hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end, {remap=true})
            vim.keymap.set('', 'F', function()
              hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end, {remap=true})
            vim.keymap.set('', 't', function()
              hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end, {remap=true})
            vim.keymap.set('', 'T', function()
              hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
            end, {remap=true})

          end
        }

        use {"lifepillar/vim-gruvbox8",
        config = function()
            vim.cmd[[
            set background=dark
            colorscheme gruvbox8
        ]] end
        }

        use {'akinsho/bufferline.nvim', tag = "v3.*", config = function() require("plugin.bufferline_config") end, event={"BufCreate", "BufEnter"}, opt=true}

	use {"norcalli/nvim-colorizer.lua", event="BufReadPre", config=function() require'colorizer'.setup() end}

        use {"hrsh7th/vim-vsnip", requires = {
                "hrsh7th/cmp-vsnip", event="InsertEnter"
        }}

        use {"rafamadriz/friendly-snippets", event="InsertEnter"}

        use {"onsails/lspkind.nvim", opt=true}

        use {"hrsh7th/nvim-cmp",
                requires = {
                        {"hrsh7th/cmp-cmdline", opt=true},
                        {"hrsh7th/cmp-path", opt=true},
                        {"hrsh7th/cmp-buffer", opt=true},
                        {"hrsh7th/cmp-nvim-lsp", opt=true},
                },
                event="InsertEnter",
                config = function()
                        vim.cmd [[
                        PackerLoad lspkind.nvim cmp-cmdline cmp-path cmp-buffer cmp-nvim-lsp
                        ]]
                        require("plugin.cmp_config")
                end
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
        }

        use {'xiyaowong/nvim-transparent', config = function() require("plugin.transparent_config") end}

        use {
                "ntpeters/vim-better-whitespace",
                event="BufReadPre", opt=true,
        }

        use({
            "kylechui/nvim-surround",
            event = "BufReadPre",
            opt = true,
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
                event="InsertEnter", opt=true,
        }
        use {
                "alvan/vim-closetag",
                ft = {"html", "xml", "xhtml", "phtml"}
        }
        use {"mg979/vim-visual-multi", keys = "<C-n>", opt=true,}
        -- use 'wakatime/vim-wakatime'
        use {
                "tpope/vim-commentary",
                keys = {"gc", "gcc"}
        }
        use {
                "ThePrimeagen/harpoon",
        }

        use {"tpope/vim-unimpaired"}
        use {"moll/vim-bbye", event="BufCreate"}
        use {"dhruvasagar/vim-zoom", keys = "<C-w>m"}
        use {
            "ellisonleao/glow.nvim",
            cmd = {'Glow', 'Glow!'},
            config = function()
                require('glow').setup({
                    style = "C:\\Users\\OreoD\\OneDrive\\Desktop\\Glow\\gruvbox.json",
                    border = "rounded",
                    width = 140,
                    height = 160,
                })
            end
        }
end)
