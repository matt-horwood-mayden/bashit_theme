#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" ${green}|"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

function __bobby_clock() {
	printf '%s' "$(clock_prompt) "

	if [[ "${THEME_SHOW_CLOCK_CHAR:-}" == "true" ]]; then
		printf '%s' "$(clock_char) "
	fi
}

__horwood_ruby(){
  if [ "$(ruby_version_prompt)" != '' ]
  then
    echo "$(ruby_version_prompt) - "
  else
    echo ''
  fi
}

function prompt_command() {
  PS1="\n$(battery_char) "
  PS1+="$(__bobby_clock)${yellow}$(__horwood_ruby)$(python_version_prompt) "
  PS1+="${purple}\h ${reset_color}in ${green}\w"
  PS1+="\n ${bold_cyan}$(scm_prompt_char_info) ${green}→${reset_color} "
}

THEME_SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"true"}
THEME_CLOCK_CHAR_COLOR=${THEME_CLOCK_CHAR_COLOR:-"$red"}
THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$bold_cyan"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%Y-%m-%d %H:%M:%S"}

safe_append_prompt_command prompt_command
