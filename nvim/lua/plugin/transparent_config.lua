require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared

    "BufferLineFill",
  },
  exclude = {

    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineSelectedSeparator",
    "BufferLineIndicatorSelected",
    "BufferLineIndicator",
  }, -- table: groups you don't want to clear
})
