# antigen should be in the same directory
source .antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle archlinux
antigen bundle bundler
antigen bundle dirhistory
antigen bundle fasd
antigen bundle gem
antigen bundle gitfast
antigen bundle gitextras
antigen bundle git_remote_branch
antigen bundle github
antigen bundle jsontools
antigen bundle last-working-dir
antigen bundle lein
antigen bundle lol
antigen bundle rails3
antigen bundle ruby
antigen bundle ssh-agent
antigen bundle systemd
antigen bundle urltools
antigen bundle web-search

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme af-magic

# Tell antigen that you're done.
antigen apply
