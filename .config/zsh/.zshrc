PLUGIN_DIR=$HOME/.local/share/zsh/plugins

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search   # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
bindkey '^ ' autosuggest-accept

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

[ -f $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \. $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $PLUGIN_DIR/zsh-autopair/zsh-autopair.plugin.zsh ] && \. $PLUGIN_DIR/zsh-autopair/zsh-autopair.plugin.zsh
[ -f $PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh ] && \. $PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh
fpath+=(
	"$PLUGIN_DIR/zsh-completions/src"
	"/opt/homebrew/share/zsh/site-functions"
)
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^[[Z' reverse-menu-complete

autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes.
function zle-keymap-select() {
	case $KEYMAP in
	vicmd) echo -ne '\e[1 q' ;;        # block
	viins | main) echo -ne '\e[5 q' ;; # beam
	esac
}
zle -N zle-keymap-select

zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap
	echo -ne "\e[5 q"
}
zle -N zle-line-init
zle_highlight+=(paste:none)

PROMPT_EOL_MARK=""

setopt autocd
setopt interactive_comments
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt AUTOPARAMSLASH
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

HISTSIZE=16384
SAVEHIST=16384
HISTFILE=$HOME/.cache/zshist

alias ls="exa --icons --sort type -a"
alias ll="exa --icons --long --sort type -ag"
alias tree="exa --icons --git -a --tree -s type -I '.git|node_modules|bower_components'"
alias rm="rm -rf"
alias df="df -h"
alias mkdir="mkdir -vp"
alias mv="mv -v"
alias cp="cp -rv"
alias scp="scp -r"
alias du="du -h"
alias py="python3"
alias vim="nvim"
alias :e="nvim"
alias :E="nvim"
alias top="sudo btop"
alias bruh="brew"
alias port="sudo port"
alias up="uptime"
alias c="clear"
alias reload="exec zsh"
alias :h="man"
alias copy="pbcopy"
alias cat="bat"
alias g="git"
alias :q="exit"
alias :Q="exit"
alias hehe="echo he he"
alias wget="wget --hsts-file=~/.cache/wget-hsts"
alias ipp="curl ipinfo.io/ip"

function cw() {
	osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$1\""
}

function mkcd() {
	mkdir -p "$@" && cd "$@"
}

function ce {
	DEEP=$1
	[ -z "${DEEP}" ] && { DEEP=1; }
	for i in $(seq 1 ${DEEP}); do cd ../; done
}

function exc {
	if [ -f "$1" ]; then
		case $1 in
		*.tar.xz) tar -xvf "$1" ;;
		*.tar.bz2) tar -jxvf "$1" ;;
		*.tar.gz) tar -zxvf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.dmg) hdiutil mount "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar -xvf "$1" ;;
		*.tbz2) tar -jxvf "$1" ;;
		*.tgz) tar -zxvf "$1" ;;
		*.zip) unzip "$1" ;;
		*.pax) pax -r <"$1" ;;
		*.pax.z) uncompress "$1" --stdout | pax -r ;;
		*.rar) 7zz x "$1" ;;
		*.z) uncompress "$1" ;;
		*.7z) 7zz x "$1" ;;
		*) echo "'$1' cannot be extracted/mounted via extract()" ;;
		esac
	else
		echo "exc: file does not exist"
		return 1
	fi
}

[ -f $PLUGIN_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && \. $PLUGIN_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fast-theme ~/.config/zsh/fshtheme.ini >/dev/null

eval "$(fnm env --use-on-cd)"
