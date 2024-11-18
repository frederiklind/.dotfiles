return {
    "nanozuki/tabby.nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local theme = {
            fill = { fg='#1e2030', bg='#1e2030' },
            head = { fg='#11111b', bg='#89b4fa', style='bold' },
            current_tab = { fg='#7dc4e4', bg='#24273a' },
            tab = { fg='#6e738d', bg='#1e2030' },
            win = { fg='#6e738d', bg='#1e2030' },
            tail = { fg='#11111b', bg='#89b4fa', style='bold' },
        }

        require("tabby.tabline").set(function(line)
            return {
                {
                    { '   NEOVIM ', hl = theme.head },
                    line.sep("", theme.head, theme.fill),
                },
                line.tabs().foreach(function(tab)
                    local hl = tab.is_current() and theme.current_tab or theme.tab
                    return {
                        line.sep("", hl, theme.fill),
                        tab.is_current() and " " or "󰆣 ",
                        tab.number(),
                        --tab.name(),
                        line.sep("", hl, theme.fill),
                        hl = hl,
                        margin = " ",
                    }
                end),
                line.spacer(),
                line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                    return {
                        line.sep("", theme.win, theme.fill),
                        win.is_current() and " " or " ",
                        win.buf_name(),
                        line.sep("", theme.win, theme.fill),
                        hl = theme.win,
                        margin = " ",
                    }
                end),
                {
                    line.sep("", theme.tail, theme.fill),
                    { "   BUF ", hl = theme.tail },
                },
                hl = theme.fill,
            }
        end)
    end,
}
