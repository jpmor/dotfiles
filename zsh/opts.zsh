# More info at:
# http://zsh.sourceforge.net/Doc/Release/Options.html

# no prompt for rm -r
setopt rmstarsilent

# recognize comments
setopt interactivecomments

# Print job notifications in the long format by default.
setopt long_list_jobs

# Perform implicit tees or cats when multiple redirections are attempted
setopt multios

# Allows more powerful glob matching
setopt extended_glob
# But supress errors if that globbing has no match
setopt NO_NOMATCH

# If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD
