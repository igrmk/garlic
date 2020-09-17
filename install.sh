#!/bin/bash

function add_to_list() {
    readarray -t arr < <(dconf read /org/gnome/terminal/legacy/profiles:/list | grep -oP "'.*?'")
    for i in "${arr[@]}"; do [[ "$i" == "'$1'" ]] && return; done
    dconf write /org/gnome/terminal/legacy/profiles:/list "[$(printf %s "'$1'" "${arr[@]/#/, }")]"
}

add_to_list e32bd0f1-e502-46bf-b013-7bcbbcdd91ee
add_to_list bdc8e896-f9d6-405b-98a6-2beb26b878ab

dconf load /org/gnome/terminal/ < themes.dconf
