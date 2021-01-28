
repos=(
    "https://gitlab.com/b9aiteam/worker.git"
    "https://gitlab.com/b9aiteam/reactjsdemo1.git"
    "https://gitlab.com/b9aiteam/go-api.git"
)

# shellcheck disable=SC2034
name_pattern=".*/(.*).git"

_clone ()
{

    repos_to_clone=("$@")
    for repo in "${repos_to_clone[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]

        # If a directory exists and it is nonempty, assume the repo has been checked out
        # and only make sure it's on the required branch
        cd ../
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
