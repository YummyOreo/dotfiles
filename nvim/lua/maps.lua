vim.g.mapleader = " "

local function nnoremap(shortcut, command)
    vim.api.nvim_set_keymap("n", shortcut, command, { noremap = true, silent = true })
end

local function vnoremap(shortcut, command)
    vim.api.nvim_set_keymap("v", shortcut, command, { noremap = true, silent = true })
end

local function map(shortcut, command)
    vim.api.nvim_set_keymap("", shortcut, command, { noremap = true, silent = true })
end

nnoremap("<Leader>t", "<cmd>po<CR>")
nnoremap("<Leader>o", "<cmd>SymbolsOutline<cr>")

nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')

-- nnoremap("<C-s>", "source .\\session.vim")

map("<C-l>",
    "<cmd>nohlsearch<cr><cmd>diffupdate<cr><cmd>syntax sync fromstart<cr><c-l>")

map("gr", "<cmd>Telescope lsp_references<CR>")
nnoremap("gt", "<cmd>Telescope lsp_type_definitions<CR>")
nnoremap("<Leader>d", "<cmd>Telescope diagnostics<CR>")


nnoremap("<TAB>", "<cmd>bnext<CR>")
nnoremap("<S-TAB>", "<cmd>bprevious<CR>")

vnoremap("<", "<gv")
vnoremap(">", ">gv")

map("<leader>j", "<C-W><C-J>")
map("<Leader>k", "<C-W><C-K>")
map("<Leader>l", "<C-W><C-L>")
map("<Leader>h", "<C-W><C-H>")

map("<Leader>bd", "<cmd>bdelete!<CR>")

map('x', '"_x')

nnoremap("<Leader>ZZ", "<cmd>:FloatermKill<CR><cmd>mksession! session.vim<CR><cmd>wqa<CR>")

map('<Leader>w', '<cmd>HopWordAC<CR>', { noremap = true, silent = true })
map('<Leader>W', '<cmd>HopWordCurrentLine<CR>', { noremap = true, silent = true })
map('<Leader>B', '<cmd>HopWordBC<CR>', { noremap = true, silent = true })

nnoremap("<Leader>gg", "<cmd>Glow<CR>")

vim.cmd([[
    let g:floaterm_keymap_toggle = '<Leader>T'
    let g:floaterm_shell = 'nu'
]])

nnoremap("<Leader>T", "<cmd>FloatermNew<cr>")
nnoremap("<Leader>N", "<cmd>FloatermNew<cr>")
vim.keymap.set('t', "<Leader>T", "<C-\\><C-N>:FloatermToggle<cr>")
vim.keymap.set('t', "<Leader>N", "<C-\\><C-N>:FloatermNew<cr>")
vim.keymap.set('t', "<Leader>n", "<C-\\><C-N>:FloatermNext<cr>")
vim.keymap.set('t', "<C-k>", "<C-\\><C-N>:FloatermKill<cr>")
vim.keymap.set('t', "<C-h>", "<C-\\><C-N>")

vim.keymap.set("n", "<leader>bs", function()
    require("browse").browse()
end)
