#!/bin/sh
#
# The command should be run in the git repository root.
# It adds all symlinks to a .gitignore file that aren't in there already.

for f in $(git status --porcelain | grep '^??' | sed 's/^?? //'); do
    if test -L "$f"
    then
        test -L "$f" && echo $f >> .gitignore;
    elif test -d "$f"
    then
        find ${f%/} -type l -not -exec grep -q "^{}$" .gitignore \; -print >> .gitignore
    fi
done
