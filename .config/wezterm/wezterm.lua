local wezterm = require 'wezterm'
-- The filled in variant of the < symbol for tab
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol for tab
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

-- Maximize window
local mux = wezterm.mux
local config = {}
local act = wezterm.action

-- Maximize on startup
wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

return {
  -- color_scheme: 'Dracula (Official)',local config = {}
  color_scheme = "Dracula",
  font = wezterm.font 'Hack Nerd Font',
  font_size = 16.0,
  scrollback_lines = 5000,
  window_background_opacity = 0.85,
  window_decorations = "RESIZE",
  automatically_reload_config = true,
  -- WORKAROUND gnome wayland 
  enable_wayland = false,
  front_end = "OpenGL", -- "WebGpu", "Software"
  -- END WORKAROUND
    -- Added by Guillermo
  hide_tab_bar_if_only_one_tab = true,
  leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    -- splitting
    {
      mods   = "LEADER",
      key    = "-",
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
      mods   = "LEADER",
      key    = "\\",
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
      mods = 'LEADER',
      key = 'm',
      action = wezterm.action.TogglePaneZoomState
    },
    -- rotate panes
    {
      mods = "LEADER",
      key = "Space",
      action = wezterm.action.RotatePanes "Clockwise"
    },
      -- show the pane selection mode, but have it swap the active and selected panes
    {
      mods = 'LEADER',
      key = '0',
      action = wezterm.action.PaneSelect {
        mode = 'SwapWithActive',
      },
    },
    -- activate copy mode or vim mode
    {
      key = 'Enter',
      mods = 'LEADER',
      action = wezterm.action.ActivateCopyMode
    }
  },

  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
  },

  anti_alias_custom_block_glyphs = true,
  animation_fps = 10,

  --  Note: View if text background opacity works fine, by default 1.0
  text_background_opacity = 0.85,
  
  -- Enable the scrollbar.
  -- It will occupy the right window padding space.
  -- If right padding is set to 0 then it will be increased
  -- to a single cell width
  enable_scroll_bar = true,

  ssh_domains = {
          {
                  -- This name identifies the domain
                  name = 'raspberrypi',
                  -- The hostname or address to connect to. Will be used to match settings
                  -- from your ssh config file
                  remote_address = '192.168.0.50',
                  -- The username to use on the remote host
                  username = 'pi',
          },
  },
  
  wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#2b2042'
      foreground = '#c0c0c0'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end)
}
