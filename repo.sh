#!/usr/bin/env bash
repos=(
    "https://github.com/baolq2020/bnworker.git"
    "https://github.com/baolq2020/bnweb.git"
    "https://github.com/baolq2020/bngobe.git"
    "https://github.com/baolq2020/bnfacedetect.git"
)

# shellcheck disable=SC2034
name_pattern=".*/(.*).git"

_clone ()
{

    repos_to_clone=("$@")
    cd ../
    for repo in "${repos_to_clone[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]

        # If a directory exists and it is nonempty, assume the repo has been checked out
        # and only make sure it's on the required branch
        git clone "${repo}"
    done
}

clone ()
{
    _clone "${repos[@]}"
}

if [ "$1" == "clone" ]; then
    clone
fi
