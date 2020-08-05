# Powerline
POWERLINE_BINDINGS=/usr/share/powerline/bindings/
powerline-daemon -q  # run powerline daemon
source $POWERLINE_BINDINGS/zsh/powerline.zsh

autoload -U compinit promptinit

promptinit
# prompt pure
compinit

export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=true
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

export PROMPT_EOL_MARK="%B%F{red}🔚"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

[ -f $HOME/.bashrc ] && source $HOME/.bashrc
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
export SHELL=/bin/zsh

# add a command line to the shells history without executing it
commit-to-history () {
        print -s ${(z)BUFFER}
        zle send-break
}
zle -N commit-to-history
bindkey -M viins "^x^h" commit-to-history
bindkey -M emacs "^x^h" commit-to-history


# zsh_stats from oh-my-zsh https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/functions.zsh
function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

PAGER='less -X -M' export LESSOPEN="| pygmentize -f console -O bg=dark %s" export LESS=' -R '

EDITOR="vim"
export EDITOR

function ranger-cd {
    tempfile="$(mktemp)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
