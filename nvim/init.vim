set nocompatible

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
:call plug#end()

lua require('impatient')

set background=dark
colorscheme gruvbox8

set autoindent
set smartindent

let g:mapleader = "\<Space>"

" May need for vim (not neovim) since coc.nvim calculate byte offset by count
" utf-8 byte sequence.
set encoding=utf-8

set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

set noshowmode

set splitbelow
set splitright

nnoremap <C-t> :NERDTreeToggle<CR>

let g:EasyMotion_startofline = 1

function! Trim()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

set laststatus=2

lua require('config')

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

nnoremap <C-\> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

set termguicolors

map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

set number relativenumber

nnoremap <silent> <C-p> :Telescope find_files<CR>
" nnoremap <silent> <Leader>p :Telescope projects<CR>

let g:NERDTreeMinimalMenu=1

set expandtab
set softtabstop =4
set shiftwidth  =4

" set shell=powershell

set hidden

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <leader>y <plug>YankCode

lua require('setup_cmp')
lua require('setup_lsp')
lua require('setup_dashboard')
lua require("setup_bufferline")

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! link CmpItemKindInterface CmpItemKindVariable
highlight! link CmpItemKindText CmpItemKindVariable
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! link CmpItemKindMethod CmpItemKindFunction
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! link CmpItemKindProperty CmpItemKindKeyword
highlight! link CmpItemKindUnit CmpItemKindKeyword

nnoremap <silent> <Leader>' :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <Leader>, :<C-u>lua require("harpoon.ui").nav_file(vim.v.count)<CR>
nnoremap <Leader>. :lua require("harpoon.mark").add_file()<CR>

" For 'ntpeters/vim-better-whitespace' "
let g:better_whitespace_filetypes_blacklist = ['dashboard']
lua require'colorizer'.setup()
nnoremap <silent> <Leader>bd :bd<CR>

set scrolloff=3
set cursorline

function! CleanBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    else
        echo 'No buffer deleted'
    endif
endfunction

nnoremap <silent> <Leader><Tab>  :call CleanBuffers()<CR>
