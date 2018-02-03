## grep: colorize, and skip git dirs
alias grep='grep --color=auto --exclude-dir=.git'

## history (timestamped yyyy-mm-dd)
alias history='fc -il 1'

## arch install/sync with yas
alias yas='yaourt -S'

## arch remove with yar
alias yar='yaourt -R'

## always 'ls' after any 'cd':
function chpwd() {
    emulate -LR zsh
    ls
}

## move and rename multiple files
autoload -U zmv
alias mmv='noglob zmv -W'

############################################################################
# file handlers                                                            #
############################################################################

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
alias show='feh --auto-zoom --fullscreen'
alias -s jpg=show
alias -s jpeg=show
alias -s JPG=show
alias -s JPEG=show
alias -s png=show
alias -s gif=show
alias -s GIF=show