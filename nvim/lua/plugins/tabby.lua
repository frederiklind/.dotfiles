return {
    "nanozuki/tabby.nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local theme = {
            fill = { fg='#181926', bg='NONE' },
            current_tab = { fg='#8bd5ca', bg='#181926' },
            tab = { fg='#6e738d', bg='#181926' },
        }

        require("tabby.tabline").set(function(line)
            return {
                line.spacer(),
                {
                    { "", hl = theme.fill }
                },
                line.tabs().foreach(function(tab)
                    local hl = tab.is_current() and theme.current_tab or theme.tab
                    return {
                        tab.is_current() and "  " or "  ",
                        hl = hl,
                
                    }
                end),
                {
                    { "", hl = theme.fill }
                },
                line.spacer(),
            }
        end)
    end,
}
