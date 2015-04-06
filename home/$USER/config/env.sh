source "$HOME/config/less.env"

export EDITOR="vim"
export SDL_VIDEO_X11_DGAMOUSE=0 # Fix mouse problems in QEMU

[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"
