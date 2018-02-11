############################################################################
# shell options                                                            #
############################################################################

## enable the bell
setopt BEEP

## enable comments in interactive shells
setopt INTERACTIVE_COMMENTS

## disable flow control so "C-s" doesn't disable shell output!
unsetopt FLOW_CONTROL

############################################################################
# directories                                                              #
############################################################################

# save the last 8 visited directories
export DIRSTACKSIZE=8

# auto change to a directory with just the name
setopt AUTO_CD

# push the previous directory onto the stack after every cd
setopt AUTO_PUSHD

# don't push any dupes onto the directory stack
setopt PUSHD_IGNORE_DUPS

# don't print stack modifications
setopt PUSHD_SILENT

# push home when pushd is called without arguments
setopt PUSHD_TO_HOME

# write to multiple files at once
setopt MULTIOS

# powerful glob pattern replacing and completion
setopt EXTENDED_GLOB

# case insensitive glob/matching
unsetopt CASE_GLOB

# don't overwrite existing files with  > and >>. require >! and >>! instead.
unsetopt CLOBBER

############################################################################
# history                                                                  #
############################################################################

## history file
export HISTFILE=$HOME/.zhistory

## save the last 10000 commands
export HISTSIZE=10000
export SAVEHIST=10000

## don't overwrite the history file; add to the end instead
setopt APPEND_HISTORY

## don't wait until exiting; add to the history file as commands execute
setopt INC_APPEND_HISTORY

## save command timing
setopt EXTENDED_HISTORY

## use the same history file between shells
setopt SHARE_HISTORY

## confirm command "!" search results before executing them
setopt HIST_VERIFY

## ignore any duplicate history entries
setopt HIST_IGNORE_DUPS

## trim whitespace before writing to history
setopt HIST_REDUCE_BLANKS

## don't store history related commands in history
setopt HIST_NO_STORE

## don't store commands that start with a space
setopt HIST_IGNORE_SPACE

############################################################################
# load additional configuration                                            #
############################################################################

source $ZSHD/plugins.zsh
source $ZSHD/completion.zsh
source $ZSHD/aliases.zsh
