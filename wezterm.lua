local wezterm = require 'wezterm'

return {
  -- Nice Dark with some neon
  color_scheme = "Tomorrow Night Burns",
  -- Clean font
  font = wezterm.font('SFMono Nerd Font'),
  -- Hide tab bar if only one tab
  hide_tab_bar_if_only_one_tab = true,
  -- Sometimes you just wanna ctrl + d y'know?
  exit_behavior = "Close",
}
