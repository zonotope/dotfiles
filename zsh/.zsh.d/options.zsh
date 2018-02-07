############################################################################
# shell                                                                    #
############################################################################

## enable the bell
setopt BEEP

## disable flow control so "C-s" doesn't disable shell output!
unsetopt FLOW_CONTROL

############################################################################
# directories                                                              #
############################################################################

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

# don't overwrite existing files with  > and >>. require >! and >>! instead.
unsetopt CLOBBER
