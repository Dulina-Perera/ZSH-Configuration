# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load `aliasrc` if it exists.
[ -f "${ZDOTDIR}/aliasrc"  ] && source "${ZDOTDIR}/aliasrc"

# Load `optionrc` if it exists.
[ -f "${ZDOTDIR}/optionrc"  ] && source "${ZDOTDIR}/optionrc"

# Plugins
source "${ZDOTDIR}/plugins/powerlevel10k/powerlevel10k.zsh-theme"
source "${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "${ZDOTDIR}/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "${ZDOTDIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
source "${ZDOTDIR}/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# History
HISTFILE=~/.config/zsh/.zshhist
HISTSIZE=100000
SAVEHIST=50000

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "^[[A" history-substring-search-up
bindkey "^[OA" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[OB" history-substring-search-down
bindkey -M vicmd "^[[A" history-substring-search-up
bindkey -M vicmd "^[OA" history-substring-search-up
bindkey -M vicmd "^[[B" history-substring-search-down
bindkey -M vicmd "^[OB" history-substring-search-down
bindkey -M viins "^[[A" history-substring-search-up
bindkey -M viins "^[OA" history-substring-search-up
bindkey -M viins "^[[B" history-substring-search-down
bindkey -M viins "^[OB" history-substring-search-down

# colours
autoload -U colors && colors	      # colours
autoload -U compinit && compinit    # basic completion
autoload -U compinit colors zcalc   # theming

# tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)--color=auto}"                        # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                                                # automatically find new executables in path
zstyle ':completion:*' menu select                                                # Highlight menu selection

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

zstyle :compinstall filename '~/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dulina-perera/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dulina-perera/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dulina-perera/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dulina-perera/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The base environment is not activated by default
conda config --set auto_activate_base False

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

PATH="$PATH:/home/dulina-perera/.cargo/bin"

source /usr/share/nvm/init-nvm.sh

clear
