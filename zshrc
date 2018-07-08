# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bjornmulder/.oh-my-zsh"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export EDITOR="nvim"
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


plugins=(
	zsh-syntax-highlighting
	z
	sublime
	git
  zsh-autosuggestions
  sudo
  brew
	)


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# alias
#----------------------------------------------------------------
alias zc="v ~/.zshrc"
alias vc="v ~/.nvimrc"
alias tc="v ~/.tmux.conf"

alias ic="v ~/.config/i3/config"

alias c="clear"
alias zrel=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias hosts="sudo $EDITOR /etc/hosts"
alias ip="curl ipinfo.io/ip"

alias gs="git status"
alias gcm="git commit -m \" "
alias gfs="git flow feature start"
alias gfp="git flow feature publish"
alias gff="git flow feature finish"

# tmux
alias t="tmux"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias ta="tmux attach-session -t"

#vim
alias vim"nvim"
alias vi="nvim"
alias v="nvim"

# fixing ctags
alias ctags="`brew --prefix`/bin/ctags"

# Artisan
alias pa="php artisan"
alias pas="php artisan serve"
alias pasp="php artisan serve --port="
alias pam="php artisan migrate"

alias nrd="npm run dev"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval $(thefuck --alias FUCK)

#change location of zcompdump files
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
