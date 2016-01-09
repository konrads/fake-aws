#!/usr/bin/env bash
green="\033[32m"
red="\033[31m"
bold="\033[1m"
reset="\033[0m"

log_green() {
  echo -e "${green}$@${reset}"
}

log_bold() {
  echo -e "${bold}$@${reset}"
}

log_red() {
  echo -e "${red}$@${reset}"
}

get_docker_ip() {
  docker inspect -f '{{ .NetworkSettings.IPAddress }}' $1
}

assert_eq() {
  if [ "$2" != "$3" ]; then
    echo -e "  ${red}$1: $2 != $3${reset}"
    exit -1
  fi
}

ensure_tools() {
  set +e
  for tool_check in "${@}"
  do
    # log_bold "  ..testing tool $tool_check"
    $tool_check &> /dev/null
    assert_eq "$tool_check exit code" $? 0
  done
  set -e
}
