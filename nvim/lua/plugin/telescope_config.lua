require("telescope").setup {
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
require('telescope').load_extension('projects')

local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

_G.project_files = function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua project_files()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua project_files()<CR>', {noremap=true})

