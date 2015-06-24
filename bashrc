export PS1="[\h \W]: "
export PATH="/home/jkeen/bin:${PATH}"

ulimit -Sc unlimited

#export http_proxy='http://web-proxy.fc.hp.com:8080'
#export https_proxy='http://web-proxy.fc.hp.com:8080'
#export HTTP_PROXY='http://web-proxy.fc.hp.com:8080'
#export HTTPS_PROXY='http://web-proxy.fc.hp.com:8080'

export http_proxy='http://proxy.austin.hp.com:8080'
export https_proxy='http://proxy.austin.hp.com:8080'
export HTTP_PROXY='http://proxy.austin.hp.com:8080'
export HTTPS_PROXY='http://proxy.austin.hp.com:8080'

export no_proxy='127.0.0.1,192.168.0.0/16,192.168.10.4,192.168.10.5,10.0.0.0/8,.hpcloud.net'

alias sudo='sudo -E'
alias ls='ls -F'
alias bc='bc $HOME/.bc'

export TESTSUITE_DIR='~/projects/nosetestgui'
alias ts='wish $TESTSUITE_DIR/TestSuite.tcl'

alias mini='vagrant ssh mini-mon'
alias dev='vagrant ssh devstack'

function vim() {
    if [ -z $1 ]; then
        /usr/bin/vim
    else
        if [ $1 = "-g" ]; then
            shift
            xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* -e /usr/bin/vim -p $@ &
        else
            /usr/bin/vim -p $@
        fi
    fi
}

function open() {
    if [ -z $1 ]; then
        xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* &
        xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* &
        xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* &
        xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* &
        clear
    else    
        cd $1
        xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* &
        xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* &
        xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* &
        xterm -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-* &
        clear
    fi
}
