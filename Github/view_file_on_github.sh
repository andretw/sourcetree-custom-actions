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

function get_md5sum() {
    # I installed md5sha1sum on Mac OS X by using the command "brew install md5sha1sum"
    echo -n $1 | /usr/local/bin/md5sum | cut -d ' ' -f 1
}

#https://github.com/migme/adhoc-scripts/blob/4d1460bbbf7e8e57700b46aafac654479a8dea89/unity/manual/vpn/tinc/README.md

open "$(get_github_base_url)blob/$1/$2"
