# antigen should be in the same directory
source .antigen/antigen.zsh

# from oh my zsh:
antigen use oh-my-zsh

antigen bundle archlinux
antigen bundle battery
antigen bundle bundler
antigen bundle colored-man
antigen bundle colorize
antigen bundle compleat
antigen bundle cp
antigen bundle dirhistory
antigen bundle fasd
antigen bundle gem
antigen bundle gitfast
antigen bundle github
antigen bundle history
antigen bundle jsontools
antigen bundle lein
antigen bundle lol
antigen bundle pj
antigen bundle rand-quote
antigen bundle rails
antigen bundle rbenv
antigen bundle ruby
antigen bundle safe-paste
antigen bundle ssh-agent
antigen bundle systemd
antigen bundle themes
antigen bundle urltools
antigen bundle web-search

# from zsh-users
antigen bundle zsh-users/zsh-syntax-highlighting



antigen theme af-magic

antigen apply

echo
fortune
echo
