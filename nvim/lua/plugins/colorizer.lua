
return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    config = function()
        require("colorizer").setup({
            "*", -- Enable for all filetypes
            "!vim", -- Exclude vim filetype
            css = { rgb_fn = true }, -- Enable rgb(...) in css
            html = {
                mode = "foreground", -- Or "background"
                names = false,       -- Disable color names like "Blue"
            },
        }, {
            -- Default options
            mode = "foreground",
        })
    end,
}

