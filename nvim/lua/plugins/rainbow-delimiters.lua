return {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        local rainbow_delimiters = require("rainbow-delimiters")

        require("rainbow-delimiters.setup").setup {
            strategy = {
                -- Global: highlight entire buffer
                [''] = rainbow_delimiters.strategy['global'],
                -- Example: only highlight current scope for Lua
                lua = rainbow_delimiters.strategy['local'],
            },
            query = {
                -- Default query for most languages
                [''] = 'rainbow-delimiters',
                -- Example: custom query for HTML-like tags
                html = 'rainbow-blocks',
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
    end,
}

