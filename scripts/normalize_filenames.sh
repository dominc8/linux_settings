#!/bin/sh

if [ -d "$1" ]; then
    echo "$1 is a folder"
    for i in $1/*; do
        if [ -f "$i" ]; then
            echo "Renaming $i"
            echo "$i" | sed "s/ /\_/g" | xargs -I{} mv "$i" {}
        fi
    done
elif [ -f "$1" ]; then
    echo "$1 is a file"
    echo "Renaming $1"
    echo "$1" | sed "s/ /\_/g" | xargs -I{} mv "$1" {}
else
    echo "$1 is not a folder or a file"
fi
