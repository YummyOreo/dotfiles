vim.opt.termguicolors = true

-- require'colorizer'.setup()

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

vim.opt.ttyfast = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.hidden = true

vim.opt.laststatus = 2
-- vim.opt.showtabline = 2

vim.opt.scrolloff = 3
vim.opt.cursorline = true

-- tab --
vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

-- clipboard --
vim.opt.clipboard = "unnamedplus"

vim.cmd([[

" hi Search cterm=reverse
" hi IncSearch cterm=reverse

let g:better_whitespace_filetypes_blacklist = ['dashboard']

function! Trim()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

function! Ocacity(value)
     execute "silent !powershell ocacity ". a:value
endfun

command! -nargs=1 Ocacity call Ocacity(<f-args>)


]])
