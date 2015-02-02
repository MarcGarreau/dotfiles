export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:~/bin

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PS1="\W \[\033[0;33m\]⚡\[\033[0;39m\] "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export EDITOR='/usr/local/bin/atom'
export CC=/usr/local/bin/gcc-4.2
export PATH=/usr/local/git/bin:$PATH

alias cdp="cd /Users/marcgarreau/Dropbox/Projects/"
alias cdt="cd /Users/marcgarreau/Dropbox/Projects/Turing/"
alias cdf="cd /Users/marcgarreau/Dropbox/Projects/forever_career_crumbing/"
alias cdc="cd /Users/marcgarreau/Dropbox/Projects/forever_career_crumbing/12_08_14/career_crumbs"

alias     ..="cd .."
alias    ...="cd ../.."
alias   ....="cd ../../.."
alias  .....="cd ../../../.."
alias ......="cd ../../../../.."

alias br="be rspec"
alias ga="git add"
alias gs="git status"
alias gdc="git diff --cached"
alias gc="git commit"
alias gp="git push"

alias tmux="tmux -2"

# Rails
alias nuke="rake db:drop db:create db:migrate db:seed"

# Use "be" instead of "bundle exec" for Rails
alias be="bundle exec $1"

# Use "a" and a folder/file to launch Atom
alias a="atom $1"
alias s="subl $1"

# Enable git's tab-completion library
source /usr/local/etc/bash_completion.d/git-completion.bash

# #change the prompt
# function prompt_segment {
#     if [[ ! -z "$1" ]]; then
#       echo "\[\033[${2:-37};45m\]${1}\[\033[0m\]"
#     fi
#   }
# PROMPT
  function parse_git_branch {
    branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    if [ "HEAD" = "$branch" ]; then
      echo "(no branch)"
    else
      echo "$branch"
    fi
  }

  function prompt_segment {
    if [[ ! -z "$1" ]]; then
      echo "\[\033[${2:-30};46m\]${1}\[\033[0m\]"
    fi
  }

  function build_mah_prompt {
    # time
    ps1="$(prompt_segment " \@ ")"

    # cwd with coloured current directory
    # path="$(dirname `pwd`)"
    # dir="$(basename `pwd`)"
    # ps1="${ps1} $(prompt_segment " ${path}/")$(prompt_segment "$dir " 34)"

    # cwd
    ps1="${ps1} $(prompt_segment " \w ")"

    # git branch
    git_branch=`parse_git_branch`
    if [[ ! -z "$git_branch" ]]; then ps1="${ps1} $(prompt_segment " $git_branch " 30)"; fi

    # next line
    ps1="${ps1}\n\$ "

    # output
    PS1="$ps1"
  }

  PROMPT_COMMAND='build_mah_prompt'
