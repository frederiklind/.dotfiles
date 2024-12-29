return {
    "danymat/neogen",
    config = function()
        require('neogen').setup({
            enabled = true,
            languages = {
                javascript = {
                    template = {
                        ['default'] = 'jsdoc',
                    },
                },
                typescript = {
                    template = {
                        ['default'] = 'jsdoc',
                    },
                },
                typescriptreact = {
                    template = {
                        ['default'] = 'jsdoc',
                    },
                },
                lua = {
                    template = {
                        ['default'] = 'vimdoc',
                    },
                },
                java = {
                    template = {
                        ['default'] = 'javadoc',
                    },
                },
                python = {
                    template = {
                        ['default'] = 'pydoc',
                    },
                },
                go = {
                    template = {
                        ['default'] = 'godoc',
                    },
                },

            },
        })
        vim.keymap.set('n', '<leader>do', function()
            require('neogen').generate()
        end)
    end,
}
