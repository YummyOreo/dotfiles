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

nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')

map("<Leader>l",
    "<cmd>nohlsearch<cr><cmd>diffupdate<cr><cmd>syntax sync fromstart<cr><cmd>ColorizerReloadAllBuffers<cr><c-l>")

map("gr", "<cmd>Telescope lsp_references<CR>")

nnoremap("<Leader><C-p>", "<cmd>Telescope live_grep<CR>")
nnoremap("<Leader>P", "<cmd>Telescope live_grep<CR>")
nnoremap("<C-t>", "<cmd>Telescope file_browser hidden=true<CR>")
-- nnoremap("<Leader>c", "<cmd>Telescope git_commits<CR>")

nnoremap("<Leader>S", "<cmd>Telescope spell_suggest<CR>")

nnoremap("gt", "<cmd>Telescope lsp_type_definitions<CR>")
nnoremap("<Leader>d", "<cmd>Telescope diagnostics<CR>")
nnoremap('gr', "<cmd>Telescope lsp_references<CR>")
nnoremap('<Leader>"', "<cmd>Telescope projects<CR>")

nnoremap("<TAB>", "<cmd>bnext<CR>")
nnoremap("<S-TAB>", "<cmd>bprevious<CR>")

vnoremap("<", "<gv")
vnoremap(">", ">gv")

map("<C-J>", "<C-W><C-J>")
map("<C-K>", "<C-W><C-K>")
map("<C-L>", "<C-W><C-L>")
map("<C-H>", "<C-W><C-H>")

map("<Leader>bd", "<cmd>Bdelete!<CR>")

vim.cmd([[
function! CleanBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    else
        echo 'No buffer deleted'
    endif
endfunction

nnoremap <silent> <Leader><Tab>  :call CleanBuffers()<CR>

function! ToggleSpell()
    if &spell =~# 0
        set spell
    else
        set nospell
    endif
endfunction

nnoremap <silent> <Leader>s :call ToggleSpell()<cr>
]])

-- other plugins --
map('x', '"_x')

nnoremap('<C-w><left>', '<C-w><')
nnoremap('<C-w><right>', '<C-w>>')
nnoremap('<C-w><up>', '<C-w>+')
nnoremap('<C-w><down>', '<C-w>-')

nnoremap("<Leader>\'", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
nnoremap("<Leader>,", ":<C-u>lua require(\"harpoon.ui\").nav_file(vim.v.count)<CR>")
nnoremap("<Leader>.", "<cmd>lua require(\"harpoon.mark\").add_file()<CR>")

nnoremap("<Leader>ZZ", "<cmd>mksession! session.vim<CR><cmd>wqa<CR>")

map('<Leader><Leader>w', '<cmd>HopWordAC<CR>', { noremap = true, silent = true })
map('<Leader><Leader>W', '<cmd>HopWordCurrentLine<CR>', { noremap = true, silent = true })
map('<Leader><Leader>b', '<cmd>HopWordBC<CR>', { noremap = true, silent = true })
map('<Leader><Leader>a', '<cmd>HopWord<CR>', { noremap = true, silent = true })
map('<Leader><Leader>A', '<cmd>HopWordMW<CR>', { noremap = true, silent = true })
map('<Leader><Leader>k', '<cmd>HopLineStart<CR>', { noremap = true, silent = true })
map('<Leader><Leader>j', '<cmd>HopVertical<CR>', { noremap = true, silent = true })
map('<Leader>/', '<cmd>HopPattern<CR>', { noremap = true, silent = true })

map('<Leader><Leader>f', '<cmd>HopChar1<CR>', { noremap = true, silent = true })
map('<Leader><Leader>F', '<cmd>HopChar2<CR>', { noremap = true, silent = true })

nnoremap("<Leader>gg", "<cmd>Glow<CR>")


nnoremap("<Leader>bp", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
nnoremap("<Leader>bc", "<cmd>lua require'dap'.continue()<cr>")
nnoremap("<Leader>bs", "<cmd>lua require'dap'.step_over()<cr>")
nnoremap("<Leader>bo", "<cmd>lua require'dap'.repl.open()<cr>")
nnoremap("<Leader>bb", "<cmd>DapTerminate<cr>")

nnoremap("<Leader>T", "<cmd>FloatermNew<cr>")
vim.cmd([[
    let g:floaterm_keymap_toggle = '<Leader>T'
    let g:floaterm_shell = 'powershell'
]])

vim.keymap.set('t', "<C-t>", "<C-\\><C-N>:FloatermToggle<cr>")
vim.keymap.set('t', "<C-k>", "<C-\\><C-N>:FloatermKill<cr>")
