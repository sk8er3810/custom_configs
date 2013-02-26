for file in $(find . -regex '.*\.\(tpl\|php\|inc\)' ) ; do echo $file: $(git grep -l $(basename $file) | wc -l) ; done | grep -E '0$'
