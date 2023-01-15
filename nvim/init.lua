require('impatient')
require("plugin")
require("config")
require("maps")

vim.cmd [[
set list

let &listchars = 'eol:↲,leadmultispace:»   ,tab:» '

autocmd BufWritePre * :Trim
autocmd TextYankPost * :lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 1500, })
]]
