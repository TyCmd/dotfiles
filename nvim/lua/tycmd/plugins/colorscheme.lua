return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = function()
      return {
        transparent = true,
      }
    end,
    init = function()
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
      -- vim.api.nvim_set_hl(0, 'For', { italic = true })
      -- vim.api.nvim_set_hl(0, '@keyword.repeat', { italic = true })
    end,
    -- 'TyCmd/dracula-pro.nvim',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    -- config = function()
    --   require('dracula').setup {
    --     transparent = false, -- Enables transparency
    --   }
    --   vim.cmd [[colorscheme dracula]]
    -- end,
    -- 'folke/tokyonight.nvim',
    -- priority = 1000,
    -- config = function()
    --   local transparent = false -- set to true if you would like to enable transparency
    --
    --   local bg = '#011628'
    --   local bg_dark = '#011423'
    --   local bg_highlight = '#143652'
    --   local bg_search = '#0A64AC'
    --   local bg_visual = '#275378'
    --   local fg = '#CBE0F0'
    --   local fg_dark = '#B4D0E9'
    --   local fg_gutter = '#627E97'
    --   local border = '#547998'
    --
    --   require('tokyonight').setup {
    --     style = 'night',
    --     transparent = transparent,
    --     styles = {
    --       sidebars = transparent and 'transparent' or 'dark',
    --       floats = transparent and 'transparent' or 'dark',
    --     },
    --     on_colors = function(colors)
    --       colors.bg = bg
    --       colors.bg_dark = transparent and colors.none or bg_dark
    --       colors.bg_float = transparent and colors.none or bg_dark
    --       colors.bg_highlight = bg_highlight
    --       colors.bg_popup = bg_dark
    --       colors.bg_search = bg_search
    --       colors.bg_sidebar = transparent and colors.none or bg_dark
    --       colors.bg_statusline = transparent and colors.none or bg_dark
    --       colors.bg_visual = bg_visual
    --       colors.border = border
    --       colors.fg = fg
    --       colors.fg_dark = fg_dark
    --       colors.fg_float = fg
    --       colors.fg_gutter = fg_gutter
    --       colors.fg_sidebar = fg_dark
    --     end,
    --   }
    --
    --   vim.cmd 'colorscheme tokyonight'
    -- end,
    -- load the colorscheme here
    -- vim.cmd [[colorscheme tokyonight]]
    -- 'rose-pine/neovim',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    -- config = function()
    --   require('rose-pine').setup {
    --     styles = {
    --       bold = false,
    --       italic = false,
    --       transparency = true,
    --     },
    --     -- other options...
    --   }
    --   vim.cmd [[colorscheme rose-pine]]
    -- end,
    -- 'craftzdog/solarized-osaka.nvim',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd [[colorscheme solarized-osaka]]
    -- end,
    -- 'EdenEast/nightfox.nvim',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    -- config = function()
    --   require('nightfox').setup {
    --     options = {
    --       transparent = true, -- Enable transparency
    --       styles = {
    --         comments = 'italic', -- Change style of comments to be italic
    --         keywords = 'italic,bold', -- Change style of keywords to be bold
    --         -- functions = 'italic,bold', -- Change style of functions to be italic and bold
    --       },
    --     },
    --     -- other options...
    --   }
    --   vim.cmd.colorscheme 'nightfox'
    --   vim.api.nvim_set_hl(0, '@keyword.repeat', { italic = true })
    -- vim.cmd [[colorscheme Carbonfox]]
    -- end,
    -- 'projekt0n/github-nvim-theme',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    -- config = function()
    --   require('github-theme').setup {
    --     options = {
    --       transparent = true, -- Enables transparency
    --     },
    --   }
    --   vim.cmd [[colorscheme github_dark_default]]
    -- end,
    -- 'sam4llis/nvim-tundra',
    -- lazy = false,
    -- priority = 1000,
    -- opts = {},
    -- config = function()
    --   require('nvim-tundra').setup {
    --     transparent = true, -- Set transparent background.
    --   }
    --
    --   vim.cmd [[colorscheme nvim-tundra]]
    -- end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
