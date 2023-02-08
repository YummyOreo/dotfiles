local P = {}

function P.load()
    if vim.g.colors_name == "edge" then
        require("bufferline").setup({
            options = {
                mode = "buffers",
                separator_style = "slant",
                always_show_bufferline = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                -- color_icons = true,
                --3f434e
            },
            highlights = {
                separator_selected = {
                    fg = '#2c2e34',
                    bg = '#3f434e',
                },
                separator_visible = {
                    fg = '#2c2e34',
                    bg = '#3f434e',
                },
                separator = {
                    fg = '#2c2e34',
                    bg = '#33353f',
                },
                background = {
                    bg = '#33353f'
                },
                buffer_selected = {
                    bg = '#3f434e',
                    fg = '#5dbbc1',
                    bold = true,
                },
                fill = {
                    bg = '#2c2e34'
                },
                modified = {
                    bg = '#33353f'
                },
                modified_selected = {
                    bg = '#3f434e',
                    fg = '#5dbbc1',
                },
                buffer_visible = {
                    bg = '#3f434e',
                },
                modified_visible = {
                    bg = '#3f434e',
                },
                duplicate_selected = {
                    bg = '#3f434e',
                    fg = '#5dbbc1',
                    italic = true,
                },
                duplicate_visible = {
                    bg = '#3f434e',
                    italic = true
                },
                duplicate = {
                    bg = '#33353f',
                    italic = true
                },
            },
        })
        return
    end
    require("bufferline").setup({
        options = {
            mode = "buffers",
            separator_style = "slant",
            always_show_bufferline = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            -- color_icons = true,
        },
        highlights = {
            separator_selected = {
                fg = '#282828',
                bg = '#1d2021',
            },
            separator_visible = {
                fg = '#282828',
                bg = '#1d2021',
            },
            separator = {
                fg = '#282828',
                bg = '#3c3836',
            },
            background = {
                bg = '#3c3836'
            },
            buffer_selected = {
                bg = '#1d2021',
                fg = '#d65d0e',
                bold = true,
            },
            fill = {
                bg = '#282828'
            },
            modified = {
                bg = '#3c3836'
            },
            modified_selected = {
                bg = '#1d2021',
                fg = '#d65d0e',
            },
            buffer_visible = {
                bg = '#1d2021',
            },
            modified_visible = {
                bg = '#1d2021',
            },
            duplicate_selected = {
                bg = '#1d2021',
                fg = '#d65d0e',
                italic = true,
            },
            duplicate_visible = {
                bg = '#1d2021',
                italic = true
            },
            duplicate = {
                bg = '#3c3836',
                italic = true
            },
        },
    })
end
return P
