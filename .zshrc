ZSH_DISABLE_COMPFIX=true
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH:/mnt/c/Windows/System32/:/home/xtayex/go/bin:/home/xtayex/.cargo/bin:/home/xtayex/.pyenv/bin:/home/xtayex/.local/share/nvim/lsp/lua-language-server/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Path to your oh-my-zsh installation.
export ZSH="/home/xtayex/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    z
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.nvm/nvm.sh
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--layout=reverse --height 80% --info inline --preview 'bat --style=numbers --color=always --line-range :100 {}' --preview-window right:50%"
export BAT_THEME="TwoDark"

source $(dirname $(gem which colorls))/tab_complete.sh
# eval "$(stack --bash-completion-script stack)"
# export http_proxy=127.0.0.1:1080
# export https_proxy=127.0.0.1:1080
# eval "$(stack --bash-completion-script stack)"
alias rm=trash
alias rl='ls ~/.trash'
alias screensaver="~/cbonsai_build/bin/cbonsai --live --seed=$(date +%s)"

trash()
{
    mv -f --backup=numbered $@ ~/.trash/
}

cleartrash()
{
    echo -n "Clear trash?[n] "
    read confirm
    [ $confirm = 'y' ] || [ $confirm = 'Y' ] && [ "`ls -A ~/.trash/`" != "" ] && /bin/rm -rf ~/.trash/*
}

pyenv_install_china()
{
    wget https://npm.taobao.org/mirrors/python/$1/Python-$1.tar.xz -P ~/.pyenv/cache/; pyenv install $1 --verbose
}

set_proxy()
{
    export windows_host=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`

    export HTTPS_PROXY=http://$windows_host:7890
    export HTTP_PROXY=http://$windows_host:7890
    export ALL_PROXY=http://$windows_host:7890
    git config --global http.proxy http://$windows_host:7890
    git config --global https.proxy https://$windows_host:7890
    sudo echo "http_proxy:http://$windows_host:7890" > ~/.config/lynx-site.cfg
    sudo echo "https_proxy:http://$windows_host:7890" >> ~/.config/lynx-site.cfg
}

unset_proxy()
{
    unset HTTPS_PROXY
    unset HTTP_PROXY
    unset ALL_PROXY
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

set_fastgithub()
{
    export HTTPS_PROXY=https://$windows_host:38457
    export HTTP_PROXY=http://$windows_host:38457
    export ALL_PROXY=http://$windows_host:38457
}

alias "unset_fastgithub"="unset_proxy"

set_proxy

export DISPLAY=$windows_host:0.0


eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"

sudo chmod 666 /dev/kvm
export EDITOR="nvim.appimage"
export GPG_TTY=$(tty)

alias luamake=/home/xtayex/lua-language-server/3rd/luamake/luamake
