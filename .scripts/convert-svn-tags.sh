#!/bin/bash

for ref in $(git for-each-ref refs/remotes/tags | cut -d '/' -f 4- )
#for ref in $(git branch -r | cut -d ' ' -f 3- )
do
    read -p "Change to tag $ref [YES,no]:" confirm

    if [[ $confirm == 'YES' ]]; then
        #git tag -a "$ref" -m"$ref" "refs/remotes/tags/$ref"
        echo git tag -a "$ref" -m"$ref" $(git show $ref)
        echo git branch -rD "$ref"
        #git push origin ":refs/heads/tags/$ref"
        #git push origin tag "$ref"
    fi
done

