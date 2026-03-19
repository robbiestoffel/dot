local wezterm = require("wezterm")
local mux = wezterm.mux

----------------------------- detect_os ----------------------------

local function detect_os()
  if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
    return "macos"
  elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
    return "windows"
  elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
    return "linux"
  else
    return "unknown"
  end
end

local myos = detect_os()

--------------------------- detect_shell ---------------------------

local function detect_shell()
  if myos == "windows" then
    return { "C:/Program Files/Git/bin/bash.exe", "-i" }
  elseif myos == "mac" then
    return { "/opt/homebrew/bin/bash", "--login", }
  else
    return {"/bin/bash", "--login"}
  end
end

---------------------------- detect_font ---------------------------

local function detect_font()
  return wezterm.font("Ubuntu Mono")
end

------------------------------- main -------------------------------

return {
  window_close_confirmation = 'NeverPrompt',
  enable_tab_bar = false,
  default_prog = detect_shell(),

  color_scheme = 'Gruvbox Material (Gogh)',
  font = detect_font(),
  font_size = 18,

  colors = {
    cursor_bg = '#928374',
    cursor_border = '#928374',
  },

  window_padding = {
   left = 40,
   right = 0,
   top = 0,
   bottom = 2,
  },

  term = "xterm-256color",
  animation_fps = 60,
  max_fps = 60,

  set_environment_variables = {
    HOME = "C:\\Users\\robbie",
    PATH = os.getenv("PATH"),
    BASH_ENV = "C:\\Users\\robbie\\.bashrc",
  }
}



