#! /bin/sh
# link all files to the home directory, asking about overwrites
cd `dirname $0`
SCRIPT_DIR=`pwd`
SCRIPT_NAME=`basename $0`
FILES=`git ls-tree --name-only HEAD`

cd $HOME
for FILE in $FILES; do
    ln --symbolic --interactive $SCRIPT_DIR/$FILE
done
rm $TARGET_DIR/$SCRIPT_NAME

