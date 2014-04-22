# random one liners and other multiline functions
#aptitude search -F '%p' '~i' > 2.txt
#dpkg -l | awk '/^[hi]i/{print }' > 1.txt
#dpkg --get-selections > dpkg_-get--selections.txt
#let ++CONO ; echo "yabba dabba do ${CONO}" >> file2.txt ; hg commit -m "this is a test commit ${CONO}" -v --debug; hg push -v --debug

hg clone ssh+http://<URL>/svn/<project>  <local-dir-name>

#The Dell Latitude E6500 gets to be about 30 seconds ahead per week
#Rewind the clock 30 seconds
#/usr/bin/date -s "$(/usr/bin/date -d '30 seconds ago')" 

#time rsync -arvv "$HOME/Documents/Virtual Machines.localized/" "/Volumes/G Drive/VM Backups/"

function badeval () {
# This code is evil and must never be used!
    export IFS=" "
    [ -z "$3" ] && set -- "$1" "$2" 1
    FILES=`find "$1" -maxdepth "$3" -type f -printf "\"%p\" "`
    #printf -v FILES "%q" "`find "$1" -maxdepth "$3" -type f -printf "\"%p\" "`"
    #warning, evilness
    eval FILES=($FILES)
    for ((I=0; I < ${#FILES[@]}; I++))
    do
        printf -v sanitized "%q" "${FILES[I]}"
        eval "$2 $sanitized"
    done
    unset IFS
}

function checkpwdexpiration {
    pwPolicy=60
    user=`whoami`
    #use dscl in ineractive mode to find out ADdomain
    ADdomain="hammerscompany.com"
    userRecord=`dscl . -read /Users/$user`
    lastpwdMS=`echo "$userRecord" | grep -i SMBPasswordLastSet | sed 's/SMBPasswordLastSet: //'`
    todayUnix=`date "+%s"`
    lastpwdUnix=`expr $lastpwdMS / 10000000 - 11644473600`
    diffUnix=`expr $todayUnix - $lastpwdUnix`
    diffdays=`expr $diffUnix / 86400`
    daysremaining=`expr $pwPolicy - $diffdays`
    echo $daysremaining days remaining
}

function convert_svn_tags {
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

}

function convert_to_proper_filename {
for file in $( find . -name '*.h' ); 
do 
    filename=$( basename $file ); 
    sed -i s/\"$filename\"/\"$filename\"/I $( find . -name "*.cpp" -or -name "*.h" ); 
done 
}

function find_all_unique_extensions {
find . \
-path '*/.git' -prune -and \
-path '*/.cvs' -prune -and \
-path '*/.svn' -prune -o \
-name '*' -type f | while read file
do
    echo ${file##*.} # strip out everything except the file extension
done | sort -u  # remove all duplicate file extensions
}


function display_colors {
#
# This is not function is not mine, if you know whom to attribute this
# to please let me know
# This file echoes a bunch of color codes to the
# terminal to demonstrate what's available. Each
# line is the color code of one forground color,
# out of 17 (default + 16 escapes), followed by a
# test use of that color on all nine background
# colors (default + 8 escapes).
#
T='gYw' # The test text
echo -e "\n                 40m    41m     42m     43m\
     44m      45m    46m     47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG $T "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG $T \033[0m";
    done
    echo;
  done
echo
}

function genpasswd {
# This function takes char set and length
# as args to create a random password
# containing the characters in char_set
# of a specified length

#example
# cat /dev/urandom | env LC_CTYPE=C tr -cd [:print:] | head -c 10; echo

if [ -z $2 ]; then
    echo "Usage: randpass.sh <char set> <length>";
    exit 1;
fi

CHAR_SET=$1
LENGTH=$2
cat /dev/urandom | env LC_CTYPE=C tr -cd $CHAR_SET | head -c $LENGTH; echo

}

function convert_unicode {
iconv -f utf-16 -t utf-8 "${1}" | less
}
