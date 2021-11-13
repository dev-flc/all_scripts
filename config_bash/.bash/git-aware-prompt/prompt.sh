find_git_branch() {
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch=" <<="${branch}"=>>"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty=' ──┤▶ 🎭'
  else
    git_dirty=""
  fi
}


find_batery() {
  BATERIA=`acpi | awk '{print $4}'`
  echo $BATERIA > /home/fernandolc/.battery.txt
  RESULTADO=`cut -c 1-2 /home/fernandolc/.battery.txt`
  if [[ $RESULTADO -ge 90 ]]; then
    batery=' 🔋'
  elif [ $RESULTADO -le 50 ]; then
    batery=' 🔌'
  fi
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
