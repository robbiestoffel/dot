# dot

windows is needy and requires stupid separate dot files

remember to enable Developer Mode in settings so symbolic links work

### What Changed

**wezterm.lua**

- Added OS detection to set `default_prog` per platform
- Set `default_prog` to Git Bash (`C:/Program Files/Git/bin/bash.exe`)
- Removed `default_domain` (WSL-specific)
- Added `enable_tab_bar = false`

**.bashrc**

- Changed `exit 1` to `return 1` in the Go arch block
- Added `BASHRC_LOADED` guard to prevent double sourcing
- Added `MSYSTEM=""` and `export PS1` to prevent Git Bash overriding the prompt
- Set `$PATH` to inherit Windows PATH with custom entries appended

**.bash_profile**

- Sources `.bashrc`
- Forces `PROMPT_COMMAND`, `PS1`, and `MSYSTEM` after Git Bash's profile scripts run
