require("bufferline").setup({
  options = {
    mode = "buffers",
    -- separator_style = "slant",
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
  },
    highlights = {
    separator_selected = {
        bg = '#1d2021',
        fg = '#1d2021',
    },
    separator_visible = {
        bg = '#1d2021',
        fg = '#1d2021',
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
