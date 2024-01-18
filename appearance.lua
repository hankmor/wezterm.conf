-- 外观配置
local wezterm = require('wezterm')
local module = {}

function module.apply(config)
    -- 主题
    config.color_scheme = 'iTerm2 Default'
    -- 字体
    config.font = wezterm.font('ComicShannsMono Nerd Font', { weight = 'Regular', italic = false})
    config.font = wezterm.font_with_fallback {
        'ComicShannsMono Nerd Font',
        'JetBrains Mono'
    }
    config.font_size = 16.0
    -- 背景图
    config.window_background_image = '/Users/hank/Pictures/idea/50da68258ia8310fcb6135bdfa49f283.jpeg'
    config.window_background_image_hsb = {
        -- 亮度乘数 
        brightness = 0.05,
        -- 色相
        hue = 1.0,
        -- 饱和度
        saturation = 1.0,
    }
    -- 背景透明度
    config.window_background_opacity = 1.0
    -- 文本背景透明度
    config.text_background_opacity = 1.0
end

return module
