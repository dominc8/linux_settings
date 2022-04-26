export PATH="$PATH:/home/dominik/.local/bin:/home/dominik/.config/scripts"

# Vivado (java) fix
export _JAVA_AWT_WM_NONREPARENTING=1

[ -f "${HOME}/.config/aliasrc" ] && source "${HOME}/.config/aliasrc"

# History settings
HISTFILE=~/.cache/.histfile
HISTSIZE=10000
SAVEHIST=100000

autoload -U colors && colors

autoload -Uz vcs_info
precmd() { vcs_info }

# Prompt
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt AUTO_CD          # Automatically cd to dir
setopt AUTO_PUSHD       # automatically push old locations to directory stack
setopt CDABLE_VARS      # expand cd -x expressions
setopt PUSHD_MINUS

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit


zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v # -e for emacs, -v for vim binding



export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viis ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# zle-line-init() {
    #zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    #echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#
# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

bindkey -s '^o' 'lfcd\n'  # zsh

zstyle ':vcs_info:git*' formats '%F{32}%s%F{129}@%F{200}%r %F{172}<%b>'
zstyle ':vcs_info:svn*' formats '%F{32}%s%F{129}@%F{200}%r %F{172}<%b>'

setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'


# Load zsh-syntax-highlighting; should be last.
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh

