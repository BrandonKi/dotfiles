-- TODO:
-- * custom dashboard

-- stylua: ignore
if true then return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },

    -- lazyvim, load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
        colorscheme = "gruvbox",
        },
    },

    -- cmp, change some keymaps
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
        local cmp = require("cmp")
        opts.mapping = cmp.mapping({
            ['<Down>'] = cmp.mapping(function(fallback) cmp.close() fallback() end, { "i" }),
            ['<Up>'] = cmp.mapping(function(fallback) cmp.close() fallback() end, { "i" }),
            ["<C-Down>"] = cmp.mapping.select_next_item(),
            ["<C-Up>"] = cmp.mapping.select_prev_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            -- ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }) else fallback() end end, { "i" }),
        })
        end,
    },

    -- trouble
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
        },
    },

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },

        inactive_winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
    },
} end
