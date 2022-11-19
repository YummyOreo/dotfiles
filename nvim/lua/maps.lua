vim.g.mapleader = " "

function nnoremap(shortcut, command)
  vim.api.nvim_set_keymap("n", shortcut, command, { noremap = true, silent = true })
end

function vnoremap(shortcut, command)
  vim.api.nvim_set_keymap("v", shortcut, command, { noremap = true, silent = true })
end

function map(shortcut, command)
  vim.api.nvim_set_keymap("", shortcut, command, { noremap = true })
end

map("<c-\\>", ":nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>")

-- nnoremap("[e", ":<c-u>execute \'move -1-\'. v:count1<cr>")
-- nnoremap("]e", ":<c-u>execute \'move +\'. v:count1<cr>")

-- nnoremap("[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[")
-- nnoremap("]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<cr>")

nnoremap("<C-p>", ":Telescope find_files<CR>")
nnoremap("<Leader><C-p>", ":Telescope live_grep<CR>")

nnoremap("<TAB>", ":bnext<CR>")
nnoremap("<S-TAB>", ":bprevious<CR>")

vnoremap("<", "<gv")
vnoremap(">", ">gv")

map("<C-J>", "<C-W><C-J>")
map("<C-K>", "<C-W><C-K>")
map("<C-L>", "<C-W><C-L>")
map("<C-H>", "<C-W><C-H>")

map("<leader>y", "<plug>YankCode")

nnoremap("<Leader>bd", ":bd<CR>")

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
]])

-- other plugins --
vim.keymap.set('n', 'gt', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'gT', '<Cmd>BufferLineCyclePrev<CR>', {})

vim.keymap.set('n', 'x', '"_x')

vim.keymap.set('n', '<C-w><left>', '<C-w><')
vim.keymap.set('n', '<C-w><right>', '<C-w>>')
vim.keymap.set('n', '<C-w><up>', '<C-w>+')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')

nnoremap("<Leader>\'", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
nnoremap("<Leader>,", ":<C-u>lua require(\"harpoon.ui\").nav_file(vim.v.count)<CR>")
nnoremap("<Leader>.", ":lua require(\"harpoon.mark\").add_file()<CR>")

nnoremap("<Leader>t", ":TransparentToggle<CR>")
