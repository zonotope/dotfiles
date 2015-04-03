# oh-my-zsh installation.
export ZSH=$HOME/.zsh.d/oh-my-zsh

# custom code directory
ZSH_CUSTOM=$HOME/.zsh.d/custom

# theme name. look in $ZSH/themes/
# optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# disable bi-weekly auto-update checks?
# DISABLE_AUTO_UPDATE="true"

# how often to auto-update (in days)?
# export UPDATE_ZSH_DAYS=13

# enable command auto-correction?
# ENABLE_CORRECTION="true"

# load experimental completions
fpath=($ZSH_CUSTOM/zsh-completions/src $fpath)

# case-sensitive completion?
CASE_SENSITIVE="true"

# red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# history timestamp format
HIST_STAMPS="yyyy-mm-dd" # valid formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

# plugins load. (plugins can be found in $ZSH/plugins/*) Custom plugins may
# be added to $ZSH_CUSTOM/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
# add wisely. too many plugins slow down shell startup.
plugins=(archlinux battery bundler colored-man colorize compleat cp fasd gem gitfast github history jsontools lein pj rails rbenv ruby safe-paste ssh-agent systemd themes urltools web-search zsh-syntax-highlighting)

### user configuration

# set the syntax highligters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)

export LANG=en_US.UTF-8
export EDITOR=emacs

## set the path, and additions
export PATH=$HOME/bin:/usr/local/bin:$PATH

# rbenv
PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

#bundler
PATH=$HOME/.gem/ruby/2.2.0/bin:$PATH

# my own shit:
PATH=$HOME/.bin:$PATH

source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# file handlers:
alias edit=$EDITOR
alias play='mplayer -idx'
alias show='feh -ZF'
alias read='zathura'

alias -s txt=edit
alias -s tex=edit
alias -s conf=edit

alias -s avi=play
alias -s mpg=play
alias -s mp3=play
alias -s mp4=play
alias -s wmv=play

alias -s jpg=show
alias -s jpeg=show
alias -s JPG=show
alias -s JPEG=show
alias -s png=show
alias -s gif=show
alias -s GIF=show

alias -s pdf=read
alias -s ps=read

# always 'ls' after any 'cd':
function chpwd() {
    emulate -LR zsh
    ls
}

# move and rename multiple files
autoload -U zmv
alias mmv='noglob zmv -W'

# xterm cursor: blinking underscore
echo -e -n "\x1b[\x33 q"

# gimme a fortune when i log in:
echo
fortune -a
echo
