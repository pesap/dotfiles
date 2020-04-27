# My .zshrc config file
#
# Written by pesap
#
# Last update: 2020-04-04
#
# This is my personal zshrc configuration. Use at your own risk!

# Specify ZSH location from oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Plugins from ZSH
plugins=(
    git
    gitfast
    pip
    python
    tmux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Remove theme from ZSH
ZSH_THEME=""

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Load personal customization alias and functions
source ~/.aliases
source ~/.functions

#================================================================================
# PATH
#
# This section is for PATH configuration. If more executables are needed they go
# in this section.
#
#================================================================================

# Add commonly used folders to $PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"


export GPG_TTY=$(tty)                          # Krypt.co configuration
export MPLCONFIGDIR="$HOME/.config/matplotlib" # Matplotlib configuration file
export PYTHONDONTWRITEBYTECODE=1               # Avoid duplicate python virtualenv
export TERM=xterm-256color                     # Use fuil color terminal

# Select default editor
[ -z "$EDITOR" ] &&  export EDITOR="vim"

#================================================================================
# Custom programs
#
# This section is for custom programs, or other configuration,
# in this part. Include a comment at the end with the explanation.
#
#================================================================================

# quick fix for TMUX
[[ -z $TMUX ]] || conda deactivate; conda activate base

# Prompt configuration
eval "$(starship init zsh)"

# LaTeX
export PATH="/Library/TeX/texbin/:$PATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pesap/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pesap/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/pesap/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pesap/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

