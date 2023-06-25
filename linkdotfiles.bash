#!/bin/bash

LINK_LOG_FILE="./LINK_LOG_FILE.log"
rm $LINK_LOG_FILE
touch $LINK_LOG_FILE
for DIR in ./config/*; do
    echo "========================"
    placment=$(cat $DIR/.placement.json)
    dir=$(echo $placment | jq '.dir' | tr -d '"')
    dir="${dir//\~/$HOME}"
    type=$(echo $placment | jq '.type' | tr -d '"')
    if [ $type = "folder" ]
    then
        echo "Linking" $DIR "to" $dir
        echo "Running: ln -rsf" $DIR $dir >> $LINK_LOG_FILE
        rm -rf $dir${DIR/\.\/config\//""}
        ln -srf $DIR/ $dir >> $LINK_LOG_FILE 2>&1
    elif [ $type = "files" ]
    then
        echo "Linking files in" $DIR "to" $dir
        for LINK_FILE in "$DIR"/* $DIR/.[^.]*; do
            if [ $LINK_FILE = $DIR"/.placement.json" ]
            then
                echo "Skipping" $LINK_FILE
            elif [ $LINK_FILE = $DIR"/*" ]
            then
                continue
            else
                PLACMENT_FILE=$(echo "${LINK_FILE/$DIR/$dir}")
                echo "Linking file" $LINK_FILE "to" $PLACMENT_FILE
                echo "Running: ln -srf" $LINK_FILE $PLACMENT_FILE >> $LINK_LOG_FILE
                ln -srf $LINK_FILE $PLACMENT_FILE
            fi
        done
    else
        echo "Cant find type" $type >> $LINK_LOG_FILE
    fi

    if [ $? -eq 0 ]; then
        continue
    else
        echo "The last command failed, see" $LINK_LOG_FILE
        break
    fi
done
