#!/bin/bash

# origin http://jasonneylon.wordpress.com/2011/04/22/opening-github-in-your-browser-from-the-terminal/
# origin https://github.com/knalli/sourcetree-custom-actions

# you can put it "origin" and anything your fork's name. 
FORK_NAME="migme"

function get_github_base_url() {
    giturl=$(git config --get remote.$FORK_NAME.url)
    if [ "$giturl" == "" ]
        then
            echo "Not a git repository or no remote.origin.url set"
            exit 1;
    fi

    giturl=${giturl/git\@github\.com\:/https://github.com/}
    giturl=${giturl/\.git//}
    echo $giturl
}

open "$(get_github_base_url)commit/$1"
