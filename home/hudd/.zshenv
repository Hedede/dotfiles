if [[ -z "$XDG_CONFIG_HOME" ]]
then
        export XDG_CONFIG_HOME="$HOME/.config/"
fi

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
