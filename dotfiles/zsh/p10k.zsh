# Powerlevel10k instant prompt configuration
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k prompt segments configuration
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  dir                     # current directory
  vcs                     # git status
  kubecontext             # kubernetes context
  context                 # user@host when relevant
  command_execution_time  # duration of the last command
  newline                 # line break
  prompt_char             # prompt symbol
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status                  # exit code of the last command
  background_jobs         # presence of background jobs
  direnv                  # direnv status
  virtualenv              # python virtual environment
  nodenv                  # node version
  time                    # current time
)

# Kubernetes context styling
typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|k9s'
typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_DEFAULT_NAMESPACE=true
typeset -g POWERLEVEL9K_KUBECONTEXT_FOREGROUND=134
typeset -g POWERLEVEL9K_KUBECONTEXT_PRODUCTION_FOREGROUND=1
typeset -g POWERLEVEL9K_KUBECONTEXT_PRODUCTION_BACKGROUND=235
typeset -g POWERLEVEL9K_KUBECONTEXT_PRODUCTION_CONTENT_EXPANSION='%F{red}☸ ${P9K_KUBECONTEXT_NAMESPACE}%f'

# Context (user@host) styling
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=180
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=227
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

# Show context only when in SSH or sudo
typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%F{red}%n@%m%f'

# Command execution time
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=220

# Directory styling
typeset -g POWERLEVEL9K_DIR_FOREGROUND=31
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=103
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true

# Git styling
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=76
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=178

# Prompt character
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=76
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=196
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'

# Status
typeset -g POWERLEVEL9K_STATUS_ERROR=true
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=196

# Background jobs
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=37

# Time
typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

# Transient prompt
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

# Color palette optimized for DevOps work
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'
typeset -g POWERLEVEL9K_ICON_PADDING=moderate
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='·'
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%244F\uE0B1'
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%244F\uE0B3'
