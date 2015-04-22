# darkmate theme for zsh prompt
# author: Dylan.Wen <hhkbp2@gmail.com>
# Time-stamp: <2013-09-29 23:20>

# extend variable in prompt
unsetopt prompt_subst

autoload colors
autoload zsh/terminfo

# only for debug: set to 16 color
#export TERM=xterm-16color

if [[ "$terminfo[colors]" -ge 256 ]]; then
  # term support 256 colors
  ZSH_PROMPT_BACKGROUD_COLOR_PREFIX=%K{243}%F{233}
  ZSH_PROMPT_BACKGROUD_COLOR_SUFFIX=%k%f
  ZSH_PROMPT_PATH_COLOR_PREFIX=%K{239}%B%F{39}
  ZSH_PROMPT_PATH_COLOR_SUFFIX=%b%K{243}%F{232}
  ZSH_PROMPT_USER_COLOR_PREFIX=%F{81}
  ZSH_PROMPT_USER_COLOR_SUFFIX=%K{243}%F{232}
  ZSH_PROMPT_HIST_COLOR_PREFIX=%F{76}
  ZSH_PROMPT_HIST_COLOR_SUFFIX=%K{243}%F{232}
  ZSH_PROMPT_TIME_COLOR_PREFIX=%F{154}
  ZSH_PROMPT_TIME_COLOR_SUFFIX=%K{243}%F{232}
  ZSH_PROMPT_BANG_COLOR_PREFIX=%F{220}
  ZSH_PROMPT_BANG_COLOR_SUFFIX=%K{243}%F{232}
  ZSH_PROMPT_BANG_ROOT_COLOR_PREFIX=%F{163}
  ZSH_PROMPT_BANG_ROOT_COLOR_SUFFIX=%K{243}%F{232}
  ZSH_PS2_BACKGROUD_COLOR_PREFIX=$ZSH_PROMPT_BACKGROUD_COLOR_PREFIX
  ZSH_PS2_BACKGROUD_COLOR_SUFFIX=$ZSH_PROMPT_BACKGROUD_COLOR_SUFFIX
  ZSH_PS2_CONT_COLOR_PREFIX=$ZSH_PROMPT_BANG_COLOR_PREFIX
  ZSH_PS2_CONT_COLOR_SUFFIX=$ZSH_PROMPT_BANG_COLOR_SUFFIX
  ZSH_PS2_CONT_ROOT_COLOR_PREFIX=$ZSH_PROMPT_BANG_ROOT_COLOR_PREFIX
  ZSH_PS2_CONT_ROOT_COLOR_SUFFIX=$ZSH_PROMPT_BANG_ROOT_COLOR_SUFFIX
elif [[ "$terminfo[colors]" -ge 16 ]]; then
  # term only support 16 or less colors
  ZSH_PROMPT_BACKGROUD_COLOR_PREFIX=
  ZSH_PROMPT_BACKGROUD_COLOR_SUFFIX=
  ZSH_PROMPT_PATH_COLOR_PREFIX=%{$bg[white]$fg_bold[blue]%}
  ZSH_PROMPT_PATH_COLOR_SUFFIX=%{$reset_color%}
  ZSH_PROMPT_USER_COLOR_PREFIX=%{$fg[cyan]%}
  ZSH_PROMPT_USER_COLOR_SUFFIX=%{$reset_color%}
  ZSH_PROMPT_HIST_COLOR_PREFIX=%{$fg[green]%}
  ZSH_PROMPT_HIST_COLOR_SUFFIX=%{$reset_color%}
  ZSH_PROMPT_TIME_COLOR_PREFIX=%{$fg_bold[green]%}
  ZSH_PROMPT_TIME_COLOR_SUFFIX=%{$reset_color%}
  ZSH_PROMPT_BANG_COLOR_PREFIX=%{$fg[yellow]%}
  ZSH_PROMPT_BANG_COLOR_SUFFIX=%{$reset_color%}
  ZSH_PROMPT_BANG_ROOT_COLOR_PREFIX=%{$fg[magenta]%}
  ZSH_PROMPT_BANG_ROOT_COLOR_SUFFIX=%{$reset_color%}
  ZSH_PS2_BACKGROUD_COLOR_PREFIX=$ZSH_PROMPT_BACKGROUD_COLOR_PREFIX
  ZSH_PS2_BACKGROUD_COLOR_SUFFIX=$ZSH_PROMPT_BACKGROUD_COLOR_SUFFIX
  ZSH_PS2_CONT_COLOR_PREFIX=$ZSH_PROMPT_BANG_COLOR_PREFIX
  ZSH_PS2_CONT_COLOR_SUFFIX=$ZSH_PROMPT_BANG_COLOR_SUFFIX
  ZSH_PS2_CONT_ROOT_COLOR_PREFIX=$ZSH_PROMPT_BANG_ROOT_COLOR_PREFIX
  ZSH_PS2_CONT_ROOT_COLOR_SUFFIX=$ZSH_PROMPT_BANG_ROOT_COLOR_SUFFIX
fi

#
PROMPT="$ZSH_PROMPT_BACKGROUD_COLOR_PREFIX┌[$ZSH_PROMPT_PATH_COLOR_PREFIX%45<...<%~%<<$ZSH_PROMPT_PATH_COLOR_SUFFIX] [$ZSH_PROMPT_USER_COLOR_PREFIX%n$ZSH_PROMPT_USER_COLOR_SUFFIX] [$ZSH_PROMPT_HIST_COLOR_PREFIX%h$ZSH_PROMPT_HIST_COLOR_SUFFIX] [$ZSH_PROMPT_TIME_COLOR_PREFIX%D{%Y-%m-%d %H:%M:%S}$ZSH_PROMPT_TIME_COLOR_SUFFIX]
└[%(!.$ZSH_PROMPT_BANG_ROOT_COLOR_PREFIX#$ZSH_PROMPT_BANG_ROOT_COLOR_SUFFIX.$ZSH_PROMPT_BANG_COLOR_PREFIX%%$ZSH_PROMPT_BANG_COLOR_SUFFIX)] $ZSH_PROMPT_BACKGROUD_COLOR_SUFFIX"

PS2="$ZSH_PS2_BACKGROUD_COLOR_PREFIX [%(!.$ZSH_PS2_CONT_ROOT_COLOR_PREFIX+$ZSH_PS2_CONT_ROOT_COLOR_SUFFIX.$ZSH_PS2_CONT_COLOR_PREFIX+$ZSH_PS2_CONT_COLOR_SUFFIX)] $ZSH_PS2_BACKGROUD_COLOR_SUFFIX"


ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[magenta]%}*%{$reset_color%}"

ZSH_THEME_HG_PROMPT_PREFIX="[%{$fg_bold[yellow]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY=" %{$fg_bold[magenta]%}*%{$reset_color%}]"

# it's somehow noticeable slow to add $(svn_prompt_info) into prompt
ZSH_THEME_SVN_PROMPT_PREFIX="[%{$fg_bold[yellow]%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY=" %{$fg_bold[magenta]%}*%{$reset_color%}]"
