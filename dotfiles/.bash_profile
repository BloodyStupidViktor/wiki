echo 'Loading .bash_profile'

source ~/.bash_aliases
source ~/.bash_prompt

# Git Bash completion
test -f ~/.git-completion.bash && . $_
test -f /usr/local/share/bash-completion/bash_completion && . $_
