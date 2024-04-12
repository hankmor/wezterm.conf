-- 外观配置
local wezterm = require('wezterm')
local module = {}

-- 主入口方法，在 wezterm.lua 中调用
function module.apply(config)
    -- 主题
    -- light
    -- config.color_scheme = 'Yousai (terminal.sexy)'
    -- config.color_scheme = 'Github'
    -- config.color_scheme = 'farmhouse-light'
    -- config.color_scheme = 'Green Screen (base16)'
    -- config.color_scheme = 'Silk Light (base16)'
    -- night
    -- config.color_scheme = 'iTerm2 Default'
    -- config.color_scheme = 'Dark Pastel'
    -- config.color_scheme = 'iTerm2 Smoooooth'
    config.color_scheme = 'GitHub Dark Default'

    -- 字体
    config.font = wezterm.font('ComicShannsMono Nerd Font', { weight = 'Regular', italic = false })
    -- config.font = wezterm.font('Hack Nerd Font Mono', { weight = 'Regular', italic = false})
    -- config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular', italic = false })
    -- config.font = wezterm.font_with_fallback {
    --     'ComicShannsMono Nerd Font',
    --     'JetBrainsMono Nerd Font',
    --     'Hack Nerd Font Mono',
    -- }
    config.font_size = 14.0
    config.line_height = 1.2
    -- 背景图
    -- config.window_background_image = '/Users/hank/Pictures/idea/50da68258ia8310fcb6135bdfa49f283.jpeg'
    -- config.window_background_image = '/Users/hank/Pictures/idea/music-life-muzyka-zhizn.jpg'
    config.window_background_image = '/Users/hank/Pictures/bg/正在睡觉的北极狐.jpg'
    config.window_background_image_hsb = {
        -- 亮度乘数
        brightness = 0.5,
        -- 色相
        hue = 1.0,
        -- 饱和度
        saturation = 1.0,
    }
    -- 背景透明度
    config.window_background_opacity = 1.0
    -- 文本背景透明度
    config.text_background_opacity = 0.6
end

return module
