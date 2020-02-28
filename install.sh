#! /bin/bash
# link all files to the home directory, asking about overwrites
cd `dirname $0`
SCRIPT_DIR=`pwd`
SCRIPT_NAME=`basename $0`
FILES=`git ls-tree --name-only HEAD | grep -v .git | grep -v ignore`
FILES=$'.gitconfig\n.git-completion.bash\n.gitignore_global\n'$FILES

cd $HOME
for FILE in $FILES; do
    ln -sfn $SCRIPT_DIR/$FILE
done
rm $SCRIPT_NAME
rm curl-install.sh

