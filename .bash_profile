
alias ts="tig status"
alias gst="git status"
alias gca="git commita -a"
alias gb="git branch"

alias fixairplay="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"

# Prompt
Color_Off="\[\033[0m\]"       # Text ReseT
Yellow="\[\033[0;33m\]"       # Yellow
Green="\[\033[0;32m\]"        # Green
Red="\[\033[0;31m\]"          # Red
IBlack="\[\033[0;90m\]"       # High Intensity Black
Time24="\t"
PathShort="\w"

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
export PS1=$IBlack$Time24$Color_Off" "$Yellow$PathShort$Color_Off'\
$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'" $(__git_ps1); \
  else \
    # @5 - Changes to working tree
    echo "'$Red'" $(__git_ps1); \
  fi)"; \
fi)'$Color_Off"\$ "

# Git auto completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
