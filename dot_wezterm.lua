local wezterm = require 'wezterm'

return {
  -- Window settings
  use_ime = true, -- Enable IME support (similar to option_as_alt = "Both" in Alacritty)

  -- Hide the tab bar
  enable_tab_bar = false,

  -- Automatically attach to tmux on startup (or create a new session if none exists)
  default_prog = { '/opt/homebrew/bin/tmux', 'new', '-A' },
    -- Set environment variables for tmux
  set_environment_variables = {
    PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
  },

  -- Keyboard bindings
  keys = {
    { key = "h", mods = "CMD", action = wezterm.action.SendString "\x1bh" },
    { key = "j", mods = "CMD", action = wezterm.action.SendString "\x1bj" },
    { key = "k", mods = "CMD", action = wezterm.action.SendString "\x1bk" },
    { key = "l", mods = "CMD", action = wezterm.action.SendString "\x1bl" },
  },

  -- Font settings
  font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" }),
  font_size = 17,

  -- Theme
  color_scheme = 'Gruvbox Dark (Gogh)'
}
