return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        -- helper function for utf8 chars
        local function getCharLen(s, pos)
            local byte = string.byte(s, pos)
            if not byte then
                return nil
            end
            return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
        end

        local function applyColors(logo, colors, logoColors)
            dashboard.section.header.val = logo

            for key, color in pairs(colors) do
                local name = "Alpha" .. key
                vim.api.nvim_set_hl(0, name, color)
                colors[key] = name
            end

            dashboard.section.header.opts.hl = {}
            for i = 1, #logo do
                local line = logo[i]
                local colorLine = logoColors[i] or ""
                local highlights = {}
                local pos = 0

                for j = 1, #colorLine do
                    local opos = pos
                    pos = pos + getCharLen(line, opos + 1)

                    local color_name = colors[colorLine:sub(j, j)]
                    if color_name then
                        table.insert(highlights, { color_name, opos, pos })
                    end
                end

                table.insert(dashboard.section.header.opts.hl, highlights)
            end
            return dashboard.opts
        end

        local logo = {
            [[                                                                   ]],
            [[      ███████████           █████      ██                    ]],
            [[     ███████████             █████                            ]],
            [[     ████████████████ ███████████ ███   ███████████  ]],
            [[    ████████████████ ████████████ █████ ██████████████  ]],
            [[   █████████████████████████████ █████ █████ ████ █████  ]],
            [[ ██████████████████████████████████ █████ █████ ████ █████ ]],
            [[██████  ███ █████████████████ ████ █████ █████ ████ ██████]],
            [[██████   ██  ███████████████   ██ █████████████████]]
        }

        local logoColors = {
            [[                                             bb                      ]],
            [[      ccccccccccccccc           ccccccc      bbbb                    ]],
            [[     ccccccccccccccc             ccccccc c                           ]],
            [[     cccccccccccccabbbbbbbbb bbbbbcccccccccc bbbb   bbbbbbbbbbbbbbb  ]],
            [[    cccccccccccccbbbbbbbbbbb bbbbbbccccccccc bbbbb bbbbbbbbbbbbbbbb  ]],
            [[   cccccccccccccbbbbbbbddddbbbbbbbbbcccccccc bbbbb bbbbb bbbb bbbbb  ]],
            [[ cccccccccccccccbbbbbbbbbbbbbbbbbbbbbccccccc bbbbb bbbbb bbbb bbbbbb ]],
            [[cccccccc  ccccc bbbbbbbbbbbbbbbbbbbbb cccccc bbbbb bbbbb bbbb bbbbbbb]],
            [[aaaaaaaa   aaaa  ddddddddddddddddddd   aaaa ddddddddddddddddddddddddd]]
        }

        dashboard.section.buttons.val = {
            dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
            dashboard.button("g", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
            dashboard.button("b", " " .. " File browser", ":NvimTreeFocus <CR>"),
            dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
            dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
            dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        }

        require("alpha").setup({
            layout = {
                { type = "padding", val = 10 },  -- Adds vertical padding before the ASCII art
                dashboard.section.header,
                { type = "padding", val = 6 },  -- Additional padding between the ASCII art and buttons
                dashboard.section.buttons,
            },
            opts = applyColors(logo, {
                ["b"] = { fg = "#8aadf4", ctermfg = 33 },
                ["d"] = { fg = "#4e83ef", ctermfg = 33 },
                ["c"] = { fg = "#8bd5ca", ctermfg = 33 },
                ["a"] = { fg = "#3aa192", ctermfg = 35 },
                ["g"] = { fg = "#91d7e3", ctermfg = 29 },
                ["h"] = { fg = "#8bd5ca", ctermfg = 23 },
                ["i"] = { fg = "#a6da95", bg = "#39ac56", ctermfg = 23, ctermbg = 29 },
                ["j"] = { fg = "#b7bdf8", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
                ["k"] = { fg = "#30A572", ctermfg = 36 },
            }, logoColors)
        })
    end,
}
