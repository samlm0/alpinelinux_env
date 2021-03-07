#!/bin/ash
working_dir=$(dirname `readlink -f "$0"`)


# setup profile.d 
for folder in "profile.d" "sysctl.d";do
    /bin/ls -1 $working_dir/$folder | while read file;do
        if [ ! -L "/etc/$folder/$file" ];then
            /bin/rm -f "/etc/$folder/$file"
            ln -s "$working_dir/$folder/$file" "/etc/$folder/$file"
        fi;
    done;
done;