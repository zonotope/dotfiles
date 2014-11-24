# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler git osx macports rails ruby ssh-agent)

source $ZSH/oh-my-zsh.sh

### Customize to your needs...

## path additions:

# MacPorts
PATH=/opt/local/bin:/opt/local/sbin:$PATH

# npm
PATH=/usr/local/share/npm/bin:$PATH
# personal commands:
PATH=$HOME/.bin:$PATH

export PATH

# editor:
export EDITOR=emacs

# file handlers:
alias edit=$EDITOR
alias play='mplayer -idx'
alias show='feh -ZF'
alias read='open -a Preview'

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
fortune
echo
