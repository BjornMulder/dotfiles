# Path to your oh-my-zsh installation.
export ZSH="/Users/bjornmulder/.oh-my-zsh"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/usr/local/bin:$PATH"
export PATH="/Users/bjornmulder/scripts/bin:$PATH"
export PATH="/Applications/MAMP/Library/bin:$PATH"
export YSCI_SSH_PRIVATE_KEY_PATH=~/.ssh/id_rsa
export YSCI_ENVIRONMENT="dev"

export EDITOR="nvim"

source $ZSH/oh-my-zsh.sh

# Set name of the theme to load. Optionally, if you set this to "random"
  # it'll load a random theme each time that oh-my-zsh is loaded.
  # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
  # agnoster
  ZSH_THEME="avit"

  source $ZSH/oh-my-zsh.sh

  plugins=(
  zsh-syntax-highlighting
  z
  artisan
  sublime
  git
  zsh-autosuggestions
  sudo
  brew
  )

  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/local/etc/profile.d/z.sh

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
  alias gcheck="git checkout"
  
  alias startdwf="z middle && make up &&
z frontend && npm start &&
z openid && npm start &&
z prisma && npm start &&
"

# tmux
alias t="tmux"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias ta="tmux attach-session -t"

#vim
alias vim"nvim"
alias vi="nvim"
alias v="nvim"

alias e="emacs -nw"
alias emacs="emacs -nw"

# fixing ctags
alias ctags="`brew --prefix`/bin/ctags -R --exclude=.git ."

# Artisan
alias pa="php artisan"
alias pas="php artisan serve"
alias pasp="php artisan serve --port="
alias pam="php artisan migrate"

# Symfony console
alias sc="php bin/console"
alias scserve="php bin/console server:run"
alias scds="php bin/console server:run"

# NPM
alias nrd="npm run dev"
alias nrs="npm run start"

alias dockstop="docker stop $(docker ps -aq)"

alias fixshit="./build_scripts/automate.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval $(thefuck --alias FUCK)

#change location of zcompdump files
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

if [[ -o interactive ]]; then
  if [ "$TERM" != "screen" -a "$ITERM_SHELL_INTEGRATION_INSTALLED" = "" ]; then
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
