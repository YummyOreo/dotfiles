require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    -- ensure_installed = { "python", "rust", "javascript", "typescript", "java", "html", "css", "c_sharp" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,
    defaults = { file_ignore_patterns = { "node_modules", "target", ".git" } },

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    -- auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    },
    -- indent = {
    --     enable = true
    -- }
}
