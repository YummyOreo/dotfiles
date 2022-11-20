vim.cmd([[
:call plug#begin()
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'rust-lang/rust.vim'
Plug 'easymotion/vim-easymotion'
Plug 'lifepillar/vim-gruvbox8'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'raimondi/delimitmate'
Plug 'alvan/vim-closetag'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-commentary'
Plug 'OmniSharp/omnisharp-vim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'onsails/lspkind.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'glepnir/dashboard-nvim'
Plug 'lewis6991/impatient.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'AaronLasseigne/yank-code'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'rafamadriz/friendly-snippets'
Plug 'windwp/nvim-ts-autotag'
Plug 'xiyaowong/nvim-transparent'

Plug 'tpope/vim-unimpaired'
Plug 'ray-x/lsp_signature.nvim'
:call plug#end()
]])

vim.cmd [[
set background=dark
silent! colorscheme gruvbox8
]]
require("plugin.bufferline_config")
require("plugin.cmp_config")
require("plugin.lsp_setup")
require("plugin.lsp_sig_config")
require("plugin.dashboard_config")
require("plugin.treesitter_config")
require("plugin.telescope_config")
require("plugin.zen_mode_config")
require("plugin.lualine_config")
require("plugin.transparent_config")
