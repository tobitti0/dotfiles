#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# SHELL LOGIN WITH TMUX / If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Display MOTD in the first pane when connected to SSH
if [ -n "$SSH_CONNECTION" ] ; then
  case "$(tmux display-message -p  "#{pane_index}")" in
    1)  cat /run/motd.dynamic
        last $USER --time-format full | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | perl -lane '!/still logged in/ && print "Last login: @F[3..7] from $F[2]" and last'
        ;;
    *)  ;;
  esac
fi

# path
export PATH=$HOME/bin:/usr/local/bin:$PATH

#GPG
export GPG_TTY=$(tty)

#alias
alias python="python3"
alias t='tmux'
