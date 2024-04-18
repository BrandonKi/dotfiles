-- TODO:
-- * custom dashboard
-- * change leader to ,

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
        ["<C-Down>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-Up>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        -- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }) else fallback() end end, { "i" }),
      })
    end,
  }
} end
