## grep: colorize, and skip git dirs
alias grep='grep --color=auto --exclude-dir=.git'

## ls: colorize
if [[ "$OSTYPE" == darwin* ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

## repeat the last command with sudo
alias please='sudo $(fc -ln -1)'

## history (timestamped yyyy-mm-dd)
alias history='fc -il 1'

## move and rename multiple files
autoload -U zmv
alias mmv='noglob zmv -W'

## text
alias edit=$EDITOR
alias -s conf=edit
alias -s org=edit
alias -s tex=edit
alias -s txt=edit

## audio/video
alias play='mplayer -idx -fs'
alias -s avi=play
alias -s mpg=play
alias -s mp3=play
alias -s mp4=play
alias -s wmv=play

## images
alias show='feh --auto-zoom'
alias -s jpg=show
alias -s jpeg=show
alias -s png=show
alias -s gif=show

## always 'ls' after any 'cd':
function chpwd {
    emulate -LR zsh
    ls
}

## name the current directory
function namedir {
    eval $1=$PWD
    : $1
}
