# Spaceship {{{
# VI_MODE
SPACESHIP_VI_MODE_PREFIX=""
SPACESHIP_VI_MODE_SUFFIX=" "
SPACESHIP_VI_MODE_INSERT="[I]"
SPACESHIP_VI_MODE_NORMAL="[N]"
SPACESHIP_VI_MODE_COLOR=""

# Conda
CONDA_SHOW=true 
SPACESHIP_CONDA_PREFIX=" Conda: "
SPACESHIP_CONDA_SYMBOL=" "
SPACESHIP_CONDA_SUFFIX=""
SPACESHIP_CONDA_COLOR="blue" 


# GIT
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_PREFIX="| Git: "
# SPACESHIP_GIT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_GIT_SUFFIX=" |"
SPACESHIP_GIT_SYMBOL=" "

# GIT BRANCH
SPACESHIP_GIT_BRANCH_SHOW=true
SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_BRANCH_COLOR="magenta"
# GIT STATUS
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_GIT_STATUS_PREFIX=" ["
SPACESHIP_GIT_STATUS_SUFFIX="]"
SPACESHIP_GIT_STATUS_COLOR="yellow"
# SPACESHIP_GIT_STATUS_UNTRACKED=z?"
SPACESHIP_GIT_STATUS_UNTRACKED="Untracked "
# SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_ADDED="UnCommitted "
# SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_MODIFIED="Modified "
SPACESHIP_GIT_STATUS_RENAMED="»"
SPACESHIP_GIT_STATUS_DELETED="✘ "
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="UnMerged "
SPACESHIP_GIT_STATUS_AHEAD="⇡"
SPACESHIP_GIT_STATUS_BEHIND="⇣"
SPACESHIP_GIT_STATUS_DIVERGED="⇕"

# HOST
SPACESHIP_HOST_SHOW=true
SPACESHIP_HOST_PREFIX="at "
SPACESHIP_HOST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_HOST_COLOR="green"


if [[ $(hostname) == 'erik-Desktop' ]]; then
	# NO battery
	SPACESHIP_PROMPT_ORDER=(
	time          # Time stampts section
	user          # Username section
	host          # Hostname section
	dir           # Current directory section
	git           # Git section (git_branch + git_status)
	package       # Package version
	node          # Node.js section
	docker        # Docker section
	aws           # Amazon Web Services section
	venv          # virtualenv section
	conda         # conda virtualenv section
	pyenv         # Pyenv section
	exec_time     # Execution time
	line_sep      # Line break
	jobs          # Backgound jobs indicator
	exit_code     # Exit code section
	vi_mode       # Vi-mode indicator
	char          # Prompt character
	)
else
	# With battery
	SPACESHIP_PROMPT_ORDER=(
	time          # Time stampts section
	user          # Username section
	host          # Hostname section
	dir           # Current directory section
	git           # Git section (git_branch + git_status)
	package       # Package version
	node          # Node.js section
	docker        # Docker section
	aws           # Amazon Web Services section
	venv          # virtualenv section
	conda         # conda virtualenv section
	pyenv         # Pyenv section
	kubecontext   # Kubectl context section
	exec_time     # Execution time
	line_sep      # Line break
	battery       # Battery level and status
	jobs          # Backgound jobs indicator
	exit_code     # Exit code section
	vi_mode       # Vi-mode indicator
	char          # Prompt character
	)
fi
#}}}
