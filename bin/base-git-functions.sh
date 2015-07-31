#!/bin/bash

tm_git_stash()
{
    
    TS=`date +"%s"`
    git stash save "$TS - automated stash"

}

tm_git_stash_pop()
{
    VALID_SECONDS=10

    # looks like the following line:
    # stash@{0}: On master: 1422548744 - automated stash
    STASH_TOP_MESSAGE=`git stash list | head -n1 | cut -f3 -d:`
    NUMBER=`echo $STASH_TOP_MESSAGE | cut -f1 -d- | tr -d ' '`
    MESSAGE=`echo $STASH_TOP_MESSAGE | cut -f2 -d-`

    TS=`date +"%s"`
    HOW_RECENT=`expr $TS - $NUMBER`
    if [[ $HOW_RECENT -lt $VALID_SECONDS && $MESSAGE == *"automated stash"* ]]
    then
        echo "Popping stash"
        git stash pop
    else
        echo "No automated stash within the last $VALID_SECONDS seconds"
    fi

}

tm_git_current_branch()
{
    git branch | grep \* | cut -f2 -d' '
}

tm_get_last_branch()
{
    MESSAGE=$(git co -)
    if [[ $MESSAGE == "error: pathspec '-' did not match any file(s) known to git"* ]]
    then
        echo ""
    else
        RES=$(tm_git_current_branch)
        NOECHO=$(git co -)
        echo $RES
    fi
}

tm_restore_last_branch()
{
    git co $1
    git co -
}
