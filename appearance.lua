local wezterm = require('wezterm')
local M = {}

M.config = function(config)
  -- =========================================
  -- 主题配置
  -- =========================================

  -- light
  -- config.color_scheme = 'Yousai (terminal.sexy)'
  -- config.color_scheme = 'Github'
  -- config.color_scheme = 'farmhouse-light'
  -- config.color_scheme = 'Green Screen (base16)'
  -- config.color_scheme = 'Silk Light (base16)'
  -- night
  config.color_scheme = 'iTerm2 Default'
  -- config.color_scheme = 'Dark Pastel'
  -- config.color_scheme = 'iTerm2 Smoooooth'
  -- config.color_scheme = 'GitHub Dark'
  -- config.color_scheme = "3024 Night"

  -- =========================================
  -- 窗口配置
  -- =========================================

  -- 背景图
  -- config.window_background_image = '/Users/hank/Pictures/idea/music-life-muzyka-zhizn.jpg'
  -- config.window_background_image = '/Users/hank/Pictures/bg/正在睡觉的北极狐.jpg'
  -- config.window_background_image = '/Users/hank/Pictures/bg/xh.jpg'
  -- config.window_background_image_hsb = {
  --     -- 亮度乘数
  --     brightness = 0.1,
  --     -- 色相
  --     hue = 1.0,
  --     -- 饱和度
  --     saturation = 1.0,
  -- }
  -- 背景透明度
  -- config.window_background_opacity = 0.8
  -- 文本背景透明度
  -- config.text_background_opacity = 0.8
  -- config.window_background_opacity = 0.7
  -- 与 window_background_opacity 结合使用时，配置 macOS 在屏幕上合成窗口时使用的模糊半径量。
  -- config.macos_window_background_blur = 69
  config.window_decorations = "RESIZE" -- 配置窗口是否有标题栏和/或可调整大小的边框
  config.enable_scroll_bar = false

  -- 窗口padding 设置为0
  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }

  config.window_frame = {
    font = config.font,
    font_size = config.font_size,
  }

  -- always maximize window when opening
  wezterm.on("gui-startup", function()
    local tab, pane, window = wezterm.mux.spawn_window {}
    window:gui_window():maximize()
  end)

  wezterm.on('window-config-reloaded', function(window, pane)
    window:toast_notification('wezterm', 'configuration reloaded!', nil, 4000)
  end)

  -- =========================================
  -- Tabbar 配置
  -- =========================================

  -- config.tab_bar_at_bottom = true
  config.enable_tab_bar = true               -- 去掉tabbar
  config.hide_tab_bar_if_only_one_tab = true -- 如果只有一个 tab 则隐藏tabbar
  config.use_fancy_tab_bar = true
  config.tab_max_width = 26

  -- =========================================
  -- Performance
  -- =========================================

  config.max_fps = 24
  config.animation_fps = 0
  config.cursor_blink_ease_in = "Constant"
  config.cursor_blink_ease_out = "Constant"

  config.use_resize_increments = false
end

-- =========================================
-- Support neovim Zen mode
-- =========================================

wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    -- zenmod will use wezterm plugin to increase font size when start zenmod
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while (number_value > 0) do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      -- reset font size when quit zenmode
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      -- if no +fontsize configurated, process as absolute font size
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

return M
