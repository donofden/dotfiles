#!/bin/bash

# The Mother Of all
alias showalias='cat $HOME/.bash_aliases'
alias gohome='cd ~; clear'

# Reloads the bashrc file
alias bashreload="source ~/.bash_profile && echo Bash Profile reloaded"

# Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Command short cuts to save time
alias c='clear'
alias cl='clear;ls;pwd'
alias r='reset'
alias now='date +"%T"'
alias now-date='date +"%d-%m-%Y"'
alias sshconfig='cat ~/.ssh/config'
alias sudo='sudo '

# Display drives and space in human readable format: macOS
alias drives='df -h'
alias update-mac='brew update && brew upgrade --all && brew cask update && brew cleanup && brew cask cleanup'

# Recursively delete those annoying .DS_Store files.
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

alias hs="history | grep"
alias fhere="find . -name "

# List paths
alias path='echo -e ${PATH//:/\\n}'

# Become system administrator
alias god='sudo '

# Network
alias ping1='ping -c 4 www.google.com'

# public IP address from the command line when you're behind a router using NAT
alias myip="curl http://ipecho.net/plain; echo"

# Other Fun Stuffs
alias 'make_me_a_sandwich'='echo "What? Make it yourself"'
alias 'sudo_make_me_a_sandwich'='echo "ok"'
alias PANIC="say 'OH NO, the sky is falling'"

# Work
alias metis-open='cd ;cd git/configs/metis/development'
alias crm-open='cd ;cd git/apps/crm/'
alias sc-open='cd ;cd git/apps/support-centre/'
alias intranet-open='cd ;cd git/apps/intranet'

# most commonly used commands
# alias mcc="history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10"

# Count number of files in a directory -> usage: numfiles "test"
numfiles() { 
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
}

# Make a folder and go into it
mkcd() { mkdir -p $1; cd $1 }

# perform 'ls' after 'cd' if successful.
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}

alias cd='cdls'

# Decompress just about any compressed file format
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}






