# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh


ZSH_THEME="ys"
# agnoster
#af-magic
# crunch
# brad-muse




plugins=(
	zsh-syntax-highlighting
	z
	sublime
	git
  zsh-autosuggestions
  sudo
	)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/home/bjorn/tmp"
export PATH="$PATH:$HOME/.composer/vendor/bin:$HOME"
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='nvim'
export ANDROID_HOME="/home/bjorn/Android/Sdk"
source $ZSH/oh-my-zsh.sh


# alias
#----------------------------------------------------------------
alias zc="v ~/.zshrc"
alias vc="v ~/.nvimrc"
alias tc="v ~/.tmux.conf"

alias ic="v ~/.config/i3/config"

alias c="clear"
alias zrel=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias hosts="sudo $EDITOR /etc/hosts"
alias gs="git status"
alias gcm="git commit -m \" "
alias ip="curl ipinfo.io/ip"

alias g="z"

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

# mount pi smb share
alias mountdev="mount -t smbfs //raket@31.149.12.110/devshare ~/code/raket/devserver"



alias composer="php /usr/local/bin/composer.phar"

# python
alias p="python"
alias p3="python3"


# quick boilerplating
alias html5="sh ~/automationScripts/html5boilerplate.sh"

### linux stuff# {{{
# alias mntftp="python ~/.scripts/gcurlftpfs.py"

# alias mntdeboog="sudo curlftpfs -o allow_other d33m4l1g:^FJDjR5Z@ftp.cso-deboog.nl /home/bjorn/code/mnt/deboog"

# alias mntmooi="sudo curlftpfs -o allow_other moois2y8rvv:Uh-\&3oX8N6@ftp.mooi-stijl.nl /home/bjorn/code/mnt/mooi"

# alias mntmedema="sudo curlftpfs -o allow_other hmedema:2cf003d4@server45.hosting2go.nl /home/bjorn/code/mnt/medema"

# alias mntpersonal="sudo curlftpfs -o allow_other bjornmulder\@bjorn-mulder.com:Bm100499\!@ftp.strato.com /home/bjorn/code/mnt/bjorn-mulder.com"

# alias mntraket="sudo curlftpfs -o allow_other raket5cijz:l0S\%rL\*LWT@raket.online /home/bjorn/code/mnt/raket.online"

# alias mntvimexx="sudo curlftpfs -o allow_other deville:mamayak2000@ftp.mooi-stijlacademie.nl /home/bjorn/code/mnt/vimexx"
# # ctags
# alias ctags="ctags -R --fields=+aimlS --languages=php"

# # fucking sound issues
# alias fixmyfuckingsound="amixer -D pulse set Master 1+ toggle"# 
#
# apt aliases
# alias sagu="sudo apt-get update"
# alias sagre="sudo apt-get remove"
# alias sagur="sudo apt-get upgrade"
# alias sagi="sudo apt-get install"
# }}}


#----------------------------------------------------------------
DISABLE_AUTO_TITLE=true

export NVM_DIR="/Users/bjornmulder/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "/Users/bjornmulder/.dnx/dnvm/dnvm.sh" ] && . "/Users/bjornmulder/.dnx/dnvm/dnvm.sh" # Load dnvm

# HACK: Disable git prompt stuff
function git_prompt_info() {
   # nop
}
function parse_git_dirty() {
   # nop
}
function git_prompt_status() {
   # nop
}
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(/usr/libexec/path_helper -s)
