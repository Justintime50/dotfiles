#########################
## Personal ZSH Config ##

##########
## Path ##
export path=(
	/usr/local/opt/ruby/bin
	/usr/local/lib/ruby/gems/3.0.0/bin
	/Users/jhammond/.composer/vendor/bin
	/usr/local/bin
	/usr/bin
	/bin
	/usr/local/sbin
	/usr/sbin
	/sbin
	/opt/X11/bin
	/Users/jhammond/bin/gam
	"$(go env GOPATH)"/bin
)

############
## Prompt ##
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
export PROMPT="%n@%C $ "
HOSTNAME=$(hostname)

#############
## Aliases ##

# Tools
alias composer="php /usr/local/bin/composer"
alias emacs="emacs -nw"

## Internet/Networking
ECHO_IP_URL='ifconfig.co'
alias check-ip='curl ${ECHO_IP_URL}'
alias check-ipv4='curl -4 ${ECHO_IP_URL}'
alias check-ipv6='curl -6 ${ECHO_IP_URL}'
alias check-proxy-ip='curl -x socks5h://localhost:1080 ${ECHO_IP_URL}'
alias check-proxy-ipv4='curl -4 -x socks5h://localhost:1080 ${ECHO_IP_URL}'
alias check-proxy-ipv6='curl -6 -x socks5h://localhost:1080 ${ECHO_IP_URL}'

# Custom
alias cg="cd ~/git"
alias cgp="cd ~/git/personal"
alias cge="cd ~/git/easypost"
alias lsa="ls -la"
