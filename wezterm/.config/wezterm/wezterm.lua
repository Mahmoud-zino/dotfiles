local wezterm = require 'wezterm'
local config = {}

-- Auto-start tmux
config.default_prog = { 'tmux', 'new-session', '-A', '-s', 'main' }

-- Color scheme - purple/magenta theme matching i3
config.colors = {
  foreground = '#e0e0e0',
  background = '#1a1a2e',
  cursor_bg = '#bb86fc',
  cursor_fg = '#1a1a2e',
  cursor_border = '#bb86fc',
  selection_bg = '#9d4edd',
  selection_fg = '#e0e0e0',
  
  ansi = {
    '#1a1a2e', -- black
    '#e94560', -- red
    '#48d597', -- green
    '#f9c74f', -- yellow
    '#577ceb', -- blue
    '#bb86fc', -- magenta/purple
    '#4db5bd', -- cyan
    '#e0e0e0', -- white
  },
  brights = {
    '#676e7d', -- bright black
    '#ff6b9d', -- bright red
    '#5eead4', -- bright green
    '#ffd60a', -- bright yellow
    '#80a8ff', -- bright blue
    '#d4a5ff', -- bright magenta
    '#73daca', -- bright cyan
    '#ffffff', -- bright white
  },
}

-- Font configuration
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 11.0

-- Window appearance
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

-- Tab bar colors (purple theme)
config.colors.tab_bar = {
  background = '#16213e',
  active_tab = {
    bg_color = '#bb86fc',
    fg_color = '#1a1a2e',
    intensity = 'Bold',
  },
  inactive_tab = {
    bg_color = '#1a1a2e',
    fg_color = '#676e7d',
  },
  inactive_tab_hover = {
    bg_color = '#9d4edd',
    fg_color = '#e0e0e0',
  },
  new_tab = {
    bg_color = '#16213e',
    fg_color = '#e0e0e0',
  },
}

-- Performance
config.front_end = "WebGpu"
config.max_fps = 144

-- Cursor
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500

return config
