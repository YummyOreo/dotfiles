local _, _ = pcall(require, "impatient")
require("plugin")
require("config")
require("maps")
-- require("me.lualine")
-- require("me.telescope")

vim.cmd [[
set list

let &listchars = 'eol:↲,leadmultispace:»   ,tab:» '

autocmd BufWritePre * :Trim
autocmd TextYankPost * :lua vim.highlight.on_yank({ higroup = 'Question', timeout = 1500, })
]]
