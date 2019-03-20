############################################################################
# initialize plugin system                                                 #
############################################################################

## set the antigen path
export ADOTDIR=$ZSHD/antigen/
export ANTIGEN=$ADOTDIR/antigen.zsh
typeset -a ANTIGEN_CHECK_FILES=($0:A)

## install antigen if necessary
if [[ ! -a $ANTIGEN ]]; then
    echo "Installing Antigen...."

    if [[ ! -d $ADOTDIR ]]; then
        mkdir -p $ADOTDIR
    fi

    curl --ssl --show-error --location https://git.io/antigen > $ANTIGEN
fi

## load antigen
source $ANTIGEN

############################################################################
# declare plugins                                                          #
############################################################################

## command suggestions based on history
antigen bundle zsh-users/zsh-autosuggestions

## clipboard copy/paste
antigen bundle twang817/zsh-clipboard

## extra shell command completion
antigen bundle zsh-users/zsh-completions

## colorize command output with grc
antigen bundle joshuarubin/zsh-grc

## set the terminal title
antigen bundle jreese/zsh-titles

## command line search engine interface
antigen bundle robbyrussell/oh-my-zsh plugins/web-search


#### these plugins need to load last

## syntax highlighter
antigen bundle zsh-users/zsh-syntax-highlighting

## set the prompt
### FIXME: Setting this option here because of a possible definition order bug
###        that doesn't show the first prefix otherwise
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_PROMPT_DEFAULT_PREFIX=""
antigen theme denysdovhan/spaceship-prompt
# antigen bundle zonotope/zsh-prompt

## history search
antigen bundle zsh-users/zsh-history-substring-search

############################################################################
# install and load plugins                                                 #
############################################################################

antigen apply

############################################################################
# configure plugins                                                        #
############################################################################

#### Spaceship Prompt
source $ZSHD/prompt_fns.zsh

# SPACESHIP_EXEC_TIME_SUFFIX=$NEWLINE

SPACESHIP_CHAR_SYMBOL="%# ➜ "
SPACESHIP_CHAR_SYMBOL_SECONDARY="..➜ "

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR=white
SPACESHIP_USER_COLOR_ROOT=white
SPACESHIP_USER_PREFIX=
SPACESHIP_USER_SUFFIX=

SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_COLOR=white
SPACESHIP_HOST_PREFIX=%F{white}@%F{}
SPACESHIP_HOST_SUFFIX=

SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=true
SPACESHIP_DIR_COLOR=blue
SPACESHIP_DIR_PREFIX="%F{white}[%F{}"
SPACESHIP_DIR_SUFFIX="%F{white}]%F{}"

SPACESHIP_GIT_BRANCH_COLOR=magenta
SPACESHIP_GIT_STATUS_COLOR=magenta
SPACESHIP_GIT_STATUS_ADDED=^
SPACESHIP_GIT_STATUS_MODIFIED=*
SPACESHIP_GIT_STATUS_AHEAD=↑
SPACESHIP_GIT_STATUS_BEHIND=↓

SPACESHIP_GIT_PREFIX="%F{white} [%F{}"
SPACESHIP_GIT_SUFFIX="%F{white}]%F{}"

SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""

SPACESHIP_DOCKER_PREFIX="%F{white} [%F{}"
SPACESHIP_DOCKER_SUFFIX="%F{white}]%F{}"

SPACESHIP_GOLANG_PREFIX="%F{white} [%F{}"
SPACESHIP_GOLANG_SUFFIX="%F{white}]%F{}"

SPACESHIP_AWS_PREFIX="%F{white} [%F{}"
SPACESHIP_AWS_SUFFIX="%F{white}]%F{}"

SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_XCODE_SHOW_GLOBAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_GLOBAL=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_BATTERY_SHOW=false

SPACESHIP_PROMPT_ORDER=(
    exit_code     # Exit code section
    exec_time     # Execution time
    prompt_sep    # Dashed line to separate prompts
    time          # Time stamps section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    elixir        # Elixir section
    swift         # Swift section
    golang        # Go section
    rust          # Rust section
    haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    kubecontext   # Kubectl context section
    terraform     # Terraform workspace section
    line_sep      # Line break
    line_sep      # Line break
    jobs          # Background jobs indicator
    char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
    user          # Username section
    host          # Hostname section
)

#### zsh autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=true # fetch autosuggestions asynchronously

#### zsh syntax highliters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets) # set syntax highlighters

#### zsh history substring search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(fg:yellow) # color matches yellow
bindkey '^[[A' history-substring-search-up   # up arrow key for search up
bindkey '^[[B' history-substring-search-down # down arrow key for search down
