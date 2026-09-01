-- https://www.mattcrampton.com/blog/doubleclick_to_open_in_vim_on_osx/
-- Automator -> Application -> Run AppleScript -> Save as Application
-- Set as default app for .md (or other) files via Finder -> Get Info -> Open with -> Change All.
-- Uses `exec` so the shell process is replaced by nvim; combined with iTerm's
-- "Close session when job exits" profile setting, the window closes automatically on quit.
-- Bypasses the `vi` alias (aliases aren't expanded as exec's argument) and sets
-- NVIM_APPNAME directly so it launches AstroNvim rather than stock vim.

on run {input, parameters}
	repeat with f in input
		set posixPath to POSIX path of f
		tell application "iTerm"
			activate
			set newWindow to (create window with default profile)
			tell current session of newWindow
				write text "exec env NVIM_APPNAME=astronvim nvim " & quoted form of posixPath
			end tell
		end tell
	end repeat
	return input
end run
