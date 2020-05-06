export ZSH='/root/.oh-my-zsh'

ZSH_THEME='theunraveler'
COMPLETION_WAITING_DOTS='true'

plugins=(encode64)

source $ZSH/oh-my-zsh.sh

alias country-roads='cd ~'
alias db='service postgresql start'
alias wfuzzy='wfuzz -c -z file,/usr/share/wfuzz/wordlist/general/common.txt --hc 404'
