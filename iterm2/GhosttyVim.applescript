-- https://www.mattcrampton.com/blog/doubleclick_to_open_in_vim_on_osx/
-- Automator -> Application -> Run AppleScript -> Save as Automator app.
-- Set as default app for .md (or other) files via Finder -> Get Info -> Open with -> Change All.
--
-- Uses Ghostty's native AppleScript support (https://ghostty.org/docs/features/applescript)
-- instead of System Events/Accessibility hacks. `tell application "Ghostty"`
-- launches Ghostty if it isn't already running, and `new window` always opens
-- exactly one window either way -- unlike `open -na Ghostty`, which spawns a
-- second, blank window when Ghostty is already running.
-- `input text ... to t` pastes the command into that window's shell (a real
-- login shell, so PATH is already correct) and `send key "enter"` runs it.
-- Uses `exec` so the shell process is replaced by nvim; combined with
-- Ghostty's default "close window when process exits" behavior, the window
-- closes automatically on quit.
-- Bypasses the `vi` alias (aliases aren't expanded as exec's argument) and
-- sets NVIM_APPNAME directly so it launches AstroNvim rather than stock vim.

on run {input, parameters}
	repeat with f in input
		set posixPath to POSIX path of f
		set nvimCmd to "exec env NVIM_APPNAME=astronvim nvim " & quoted form of posixPath
		tell application "Ghostty"
			activate
			set newWin to new window
			set t to focused terminal of selected tab of newWin
			input text nvimCmd to t
			send key "enter" to t
		end tell
	end repeat
	return input
end run
