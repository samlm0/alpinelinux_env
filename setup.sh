#!/bin/ash
working_dir=$(dirname `readlink -f "$0"`)

print_line(){
    echo " [*] "$1
}

setup_cron(){
    print_line "Setting self-update cron file..."
    /bin/rm -rf /etc/periodic/hourly/000-env_sync
    ln -s `readlink -f "$0"` /etc/periodic/hourly/000-env_sync
}

setup_systemconfig(){
    print_line "Setting this system config..."
    # setup profile.d 
    for folder in "profile.d" "sysctl.d";do
        /bin/ls -1 $working_dir/$folder | while read file;do
            if [ ! -L "/etc/$folder/$file" ];then
                /bin/rm -f "/etc/$folder/$file"
                ln -s "$working_dir/$folder/$file" "/etc/$folder/$file"
            fi;
        done;
    done;
}

package_install(){
    print_line "Installing package..."
    pkgs="git coreutils"
    apk add $pkgs
}

self_update(){
    print_line "Self updating..."
    git pull
}

case $1 in
    cron) setup_cron
    ;;
    sys_config) setup_systemconfig
    ;;
    package_install) package_install
    ;;
    *) self_update
    package_install
    setup_systemconfig
    setup_cron
    ;;
esac