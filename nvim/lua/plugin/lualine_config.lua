require('lualine').setup({
    options = { theme = 'gruvbox' }
})
require('lualine').hide({
    place = {'tabline'}, -- The segment this change applies to.
    unhide = false,  -- whether to reenable lualine again/
})
