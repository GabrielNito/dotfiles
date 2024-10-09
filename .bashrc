#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# wifi list = nmcli device wifi list
# wifi connect = nmcli device wifi connect access_point_name password access_point_password

pfetch

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
Purple="$(tput setaf 5)"
White="$(tput setaf 7)"
Cyan="$(tput setaf 6)"

bash_prompt() {
    Purple="$(tput setaf 5)"
    White="$(tput setaf 7)"
    dir="$(pwd)"
    date="$(date '+%X')"
    home="/c/Users/nitog"
    if [ "$dir" = "$home" ]
    then
        width="$((($(tput cols)-${#date}-${#dir}+7)/2))"
        line="$Purple⌂$White "
        for i in `seq 2 $width`
        do
            line+="· "
        done

        echo $line $Purple$date
        echo "$Purple❱ $White"
    else
        width="$((($(tput cols)-${#date}-${#dir}+1)/2))"
        line="$Purple$dir$White"
        for i in `seq 2 $width`
        do
            line+=" ·"
        done
        echo $line $Purple$date
        echo "$Purple❱ $White"
    fi
}
PS1='$(bash_prompt)'
