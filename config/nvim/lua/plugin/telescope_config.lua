require("telescope").setup {
    defaults = { vimgrep_arguments = { 'rg', '--hidden', '--color=never', '--no-heading', '--with-filename',
        '--line-number', '--column', '--smart-case' } },
    extensions = {
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
require("telescope").load_extension('harpoon')
-- require('telescope').load_extension('projects')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pt', "<cmd>lua require('telescope').extensions.file_browser.file_browser({hidden=true, respect_gitignore=false, })<CR>", {silent=true})
vim.keymap.set('n', '<leader>ph', "<cmd>lua require('telescope.builtin').find_files({hidden=true})<CR>", {silent=true})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', "<cmd>Telescope live_grep<CR>")
