echo 'Sourcing .bash_aliases'

# Git
alias gitka='gitk --all &>/dev/null &'
alias gitkk='gitk &>/dev/null &'
alias gits='git status'
alias gitf='git fetch --tags'
alias gitp='git pull'
alias gitd='git diff'
alias gitdc='git diff --cached'
alias gitg='git rev-list --all | xargs git grep'

gitCommonFiles() {
  this=$1
  head=`git rev-parse --abbrev-ref HEAD`
  other=${2:-$head}

  prefix=$(date +%s%N)
  lista=${prefix}_lista
  listb=${prefix}_listb
  git log $(git merge-base $this $other)..$this --name-only --pretty=oneline | egrep -v '^[a-f0-9]{40} ' | sort | uniq > $lista
  git log $(git merge-base $this $other)..$other --name-only --pretty=oneline | egrep -v '^[a-f0-9]{40} ' | sort | uniq > $listb
  cat $lista $listb | sort | uniq -d
  rm $lista $listb
}

gitPrune() {
  git branch -r --merged origin/develop | egrep -v "(^\*|master|develop)" | sed 's/origin\///'
  git branch -r --merged origin/master | egrep -v "(^\*|master|develop)" | sed 's/origin\///'
  git fetch --prune
}

# Docker
gcDocker() {
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc
  docker rmi $(docker images -f dangling=true -q)
}

extendDockerComposeTimeout() {
  export COMPOSE_HTTP_TIMEOUT=200
}
