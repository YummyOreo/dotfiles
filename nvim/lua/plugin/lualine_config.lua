-- highlight BufferLineActive guifg=#32302f guibg=#d8a657
vim.cmd [[
highlight BufferLineActive guifg=#32302f guibg=#fe8019
]]

require('lualine').setup {
    options = {
        theme = 'gruvbox-material',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            { 'buffers',
                show_filename_only = true, -- Shows shortened relative path when set to false.
                hide_filename_extension = false, -- Hide filename extension when set to true.
                show_modified_status = true, -- Shows indicator when the buffer is modified.

                mode = 2, -- 0: Shows buffer name
                -- 1: Shows buffer index
                -- 2: Shows buffer name + buffer index
                -- 3: Shows buffer number
                -- 4: Shows buffer name + buffer number

                max_length = vim.o.columns / 2, -- Maximum width of buffers component,
                -- max_length = vim.api.nvim_list_uis()[1].width / 2, -- Maximum width of buffers component,
                -- it can also be a function that returns
                -- the value of `max_length` dynamically.
                filetype_names = {
                    TelescopePrompt = 'Telescope',
                    dashboard = 'Dashboard',
                    packer = 'Packer',
                    fzf = 'FZF',
                    alpha = 'Alpha'
                }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

                buffers_color = {
                    -- Same values as the general color option can be used here.
                    active = 'BufferLineActive', -- Color for active buffer.
                    -- inactive = 'BufferLineInactive', -- Color for inactive buffer.
                },

                symbols = {
                    modified = ' ●', -- Text to show when the buffer is modified
                    alternate_file = '', -- Text to show to identify the alternate file
                    directory = '', -- Text to show when the buffer is a directory
                },
            }
        },
        lualine_x = { 'filetype' },
        lualine_y = { --[[ 'progress'  ]]},
        lualine_z = { 'location' }
    },
    extensions = {'fugitive'}
}
vim.api.nvim_create_autocmd('BufWinEnter', {callback=require('lualine').refresh})
