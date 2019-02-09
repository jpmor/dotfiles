
# Load all stock functions (from $fpath files) called below.
autoload -U compinit

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file ($DOT/lib/*.zsh); do
  source $config_file
done

is_plugin() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || test -f $base_dir/plugins/$name/_$name
}
# Add all defined plugins to fpath. This must be done
# before running compinit.
for plugin ($plugins); do
  if is_plugin $DOT $plugin; then
    fpath=($DOT/plugins/$plugin $fpath)
  fi
done

compinit

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $DOT/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $DOT/plugins/$plugin/$plugin.plugin.zsh
  fi
done
