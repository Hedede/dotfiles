# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/home/hudd/.zshrc'

setopt interactivecomments


autoload -Uz compinit
compinit
# End of lines added by compinstall

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# Command prompt
autoload -U colors && colors
PROMPT="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg[cyan]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%\# "
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

# Keyboard setup
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
bindkey -e
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

bindkey "^Q" push-input

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

export PATH=$PATH:~/.gem/ruby/2.1.0/bin/

# Environmant variables
export SDL_VIDEO_X11_DGAMOUSE=0
export EDITOR="vim" 
