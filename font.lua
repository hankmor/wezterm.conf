-- =========================================
-- 字体配置
-- =========================================

local wezterm = require('wezterm')
local M = {}

M.config = function(config)
  -- config.font = wezterm.font('ComicShannsMono Nerd Font', { weight = 'Regular', italic = false })
  -- config.font = wezterm.font('Hack Nerd Font Mono', { weight = 'Regular', italic = false})
  -- config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular', italic = false })
  -- config.font = wezterm.font('Monaco', { weight = 'Regular', italic = false })
  config.font = wezterm.font_with_fallback {
    -- 'Monaco',
    'JetBrainsMono Nerd Font',
    { family = 'Hei', weight = 'Regular', stretch = 'Expanded', scale = 1.0 },
    'ComicShannsMono Nerd Font',
  }
  config.font_size = 12.0
  config.line_height = 1.2
end

return M
