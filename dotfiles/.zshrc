# Set nvim as default editor
export EDITOR='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

# Useful envs
export MYRC='~/.zshrc'

# Add my scrips dir
export PATH="$PATH:/home/$USER/scripts"
# Add yarn bins
export PATH="$PATH:$(yarn global bin)"

#Add coursier
export PATH="$PATH:/home/$USER/.local/share/coursier/bin"

# Enable colors and change prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[green]%}:%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$fg[green]%}$%b "

# Bash history
mkdir -p ~/.cache/zsh
touch -a ~/.cache/zsh/history
export HISTFILE=~/.cache/zsh/history
export HISTSIZE=32000
export SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Useful aliases
alias clip='xclip -selection clipboard'
alias ls='ls --color=auto'
alias ll='ls -la'
alias sbt_NewScalaProject='sbt new scala/scala-seed.g8'
alias hig='history 0 | grep'
alias plvpn='sudo openvpn /etc/openvpn/client/ovpn_udp/pl137.nordvpn.com.udp.ovpn'
alias devpn='sudo openvpn /etc/openvpn/client/ovpn_udp/de509.nordvpn.com.udp.ovpn'
alias pacman_remove_cache="sudo rm -r /var/cache/pacman/pkg"

# Fix java windows
export _JAVA_AWT_WM_NONREPARENTING=1

# Keybindings
open_in_same_dir () { st -d $(pwd) & disown; zle redisplay; }
zle -N open_in_same_dir                  
bindkey '^P' open_in_same_dir                  

# Enable delete key
bindkey "^[[P" delete-char

# Gtk dark mode
export GTK_THEME=Adwaita:dark

# Command search by arrows, use already typed text as prefix in seach (vim like)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
