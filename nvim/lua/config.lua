vim.opt.termguicolors = true

require'colorizer'.setup()

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.backup = false

vim.opt.updatetime = 100

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.smartcase = true

vim.opt.laststatus = 2

vim.opt.ttyfast = true
vim.opt.lazyredraw = true

vim.opt.hidden = true

vim.opt.scrolloff = 3
vim.opt.cursorline = true

-- tab --
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.cmd([[
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

let g:better_whitespace_filetypes_blacklist = ['dashboard']

function! Trim()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

function! ToggleTrasparent()
    exe ':TransparentToggle'
endfun

command! -nargs=0 ToggleTrasparent call ToggleTrasparent()
]])
