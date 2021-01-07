
# Prevent greeting on open terminal
set fish_greeting

# colored greeting :)
# colorscript random

# Aliases
alias proj "cd $HOME/Documents/programmation/projects/"
alias swim "cd $HOME/Documents/programmation/piscine/tristan.floch-piscine-2023/"
alias bch "bluetoothctl connect 38:18:4C:4B:BB:6A"
alias 42 "proj; cd 42sh/"
alias pol "$HOME/.config/polybar/launch.sh"
alias sql "cd $HOME/Documents/programmation/sql_workshop/"
alias config "git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME"
# alias 'git log' "git log --oneline --decorate --graph"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'

# confirm before overwriting something
alias cp="cp -i"

# env variable for doom emacs
set -x EMACSDIR ~/.emacs.d

set PATH $PATH /home/tristan/.local/bin

set -x PGDATA "$HOME/Documents/postgres_data"
set -x PGHOST "/tmp"

starship init fish | source
