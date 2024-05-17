-- 快捷键配置
local wezterm = require('wezterm')
local act = wezterm.action
local M = { maximized = true } -- auto maximized when startup

M.config = function(config)
  -- 36 is the default, but you can choose a different size.
  -- Uses the same font as window_frame.font
  config.pane_select_font_size = 36
  -- 配置 leader 键
  -- config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
  config.keys = {
    -- { key = 'RightArrow', mods = 'OPT|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    -- { key = 'DownArrow', mods = 'OPT|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    -- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
    { key = '8', mods = 'CTRL', action = act.PaneSelect },
    -- activate pane selection mode with numeric labels
    { key = '9', mods = 'CTRL', action = act.PaneSelect { alphabet = '1234567890', }, },
    -- show the pane selection mode, but have it swap the active and selected panes
    { key = '0', mods = 'CTRL', action = act.PaneSelect { mode = 'SwapWithActive', }, },
    -- allow to toggle maximize/normal window
    {
      key = 'm',
      mods = 'CTRL',
      action = wezterm.action_callback(function(win)
        M.maximized = not M.maximized
        if M.maximized then
          win:maximize()
        else
          win:restore()
        end
      end)
    },
  }
end

return M
