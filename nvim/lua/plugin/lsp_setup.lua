require("mason").setup()
require("mason-lspconfig").setup()

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    require "lsp_signature".on_attach()
    require 'lsp_signature'.signature()
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, { noremap = true, silent = true, buffer = 0 })

    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            flags = lsp_flags,
        }
    end,
    ["rust_analyzer"] = function()
        require 'lspconfig'.rust_analyzer.setup {
            on_attach = on_attach,
            flags = lsp_flags,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy"
                    },
                }
            }
        }
    end,

    ["pyright"] = function()
        require("lspconfig").pyright.before_init = function(params, config)
            local Path = require "plenary.path"
            local venv = Path:new((config.root_dir:gsub("/", Path.path.sep)), ".venv")
            if venv:joinpath("bin"):is_dir() then
                config.settings.python.pythonPath = tostring(venv:joinpath("bin", "python"))
            else
                config.settings.python.pythonPath = tostring(venv:joinpath("Scripts", "python.exe"))
            end
        end

        require 'lspconfig'.pyright.setup {
            on_attach = on_attach,
            flags = lsp_flags,
        }
    end
}
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['tsserver'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['marksman'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require'lspconfig'.rust_analyzer.setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     settings = {
--       ["rust-analyzer"] = {}
--     }
-- }
