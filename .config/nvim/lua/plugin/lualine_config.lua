vim.cmd [[
highlight BufferLineActive guifg=#32302f guibg=#d8a657
highlight BufferLineActive guifg=#32302f guibg=#fe8019
]]

local custom_modus_vivendi = require 'lualine.themes.modus-vivendi'
local white = "#ebdbb2"
-- local black = "#1d2021"
local red = "#fb4934"
local green = "#b8bb26"
-- local blue = "#83a598"
local magenta = "#d3869b"
-- local cyan = "#8ec07c"
local gray = "#3c3836"
local darkgray = "#282828"
local lightgray = "#504945"
local orange = "#d65d0e"
local lightorange = "#fe8019"

-- Normal
custom_modus_vivendi.normal.a.bg = orange
custom_modus_vivendi.normal.a.fg = white
custom_modus_vivendi.normal.b.bg = lightgray
custom_modus_vivendi.normal.b.fg = orange
custom_modus_vivendi.normal.c.bg = gray
custom_modus_vivendi.normal.c.fg = white
-- insert
custom_modus_vivendi.insert.a.bg = lightorange
custom_modus_vivendi.insert.a.fg = gray
custom_modus_vivendi.insert.b.bg = lightgray
custom_modus_vivendi.insert.b.fg = white
custom_modus_vivendi.insert.c.bg = gray
custom_modus_vivendi.insert.c.fg = white
-- visual
custom_modus_vivendi.visual.a.bg = magenta
custom_modus_vivendi.visual.a.fg = lightgray
custom_modus_vivendi.visual.b.bg = lightgray
custom_modus_vivendi.visual.b.fg = magenta
custom_modus_vivendi.visual.c.bg = gray
custom_modus_vivendi.visual.c.fg = white
-- replace
custom_modus_vivendi.visual.a.bg = red
custom_modus_vivendi.visual.a.fg = lightgray
custom_modus_vivendi.visual.b.bg = lightgray
custom_modus_vivendi.visual.b.fg = red
custom_modus_vivendi.visual.c.bg = gray
custom_modus_vivendi.visual.c.fg = white
-- command
custom_modus_vivendi.visual.a.bg = green
custom_modus_vivendi.visual.a.fg = lightgray
custom_modus_vivendi.visual.b.bg = lightgray
custom_modus_vivendi.visual.b.fg = green
custom_modus_vivendi.visual.c.bg = gray
custom_modus_vivendi.visual.c.fg = white
-- inactive
custom_modus_vivendi.inactive.a.bg = darkgray
custom_modus_vivendi.inactive.a.fg = lightgray
custom_modus_vivendi.inactive.b.bg = darkgray
custom_modus_vivendi.inactive.b.fg = lightgray
custom_modus_vivendi.inactive.c.bg = darkgray
custom_modus_vivendi.inactive.c.fg = lightgray
require('lualine').setup {
    options = {
        -- theme = 'gruvbox-material',
        -- TODO: replace with gruvbox mat when thing is fixed
        theme = custom_modus_vivendi,
        -- theme = 'gruvbox',
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
                    -- active = 'BufalsefferLineActive', -- Color for active buffer.
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
        lualine_y = { --[[ 'progress'  ]] },
        lualine_z = { 'location' }
    },
    extensions = { 'fugitive' }
}
vim.api.nvim_create_autocmd('BufWinEnter', { callback = require('lualine').refresh })
