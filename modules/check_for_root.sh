#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#Checks to see if the user is a sudoer -
function check_for_root_privilages(){
if [[ $EUID -ne 0 ]]; then
   sudo -k
    pass=$(whiptail --backtitle "$app_name" --title "Authentication required" --passwordbox "$app_name requires sudo.\n To continue please authenticate for user $USER:" 12 50 3>&2 2>&1 1>&3-)
    exec sudo -S -p '' "$0" "$@" <<< "$pass"
fi
}