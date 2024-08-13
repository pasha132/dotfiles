local wezterm = require 'wezterm'
local act = wezterm.action

return {
  check_for_updates = false,

  font = wezterm.font {
    family = 'Iosevka Term',
    stretch = 'Expanded',
    weight = 'Regular',
  },
  font_size = 16,
  color_scheme = 'Breeze',
  enable_tab_bar = false,
  window_padding = {
    left = '1cell',
    right = '1cell',
    top = 0,
    bottom = 0,
  },
  mouse_bindings = {
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.CompleteSelection 'PrimarySelection',
    },
    -- and make CTRL-Click open hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
    },
  },
}
