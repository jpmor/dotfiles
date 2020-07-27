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
