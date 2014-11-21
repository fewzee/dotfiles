#Set the auto completion on
autoload -U compinit
compinit
 
#Lets set some options
setopt correctall
setopt autocd
setopt auto_resume

#PROMPT="%n@%m: %~> "
autoload -U promptinit
promptinit
prompt adam2

autoload -U zmv

export REPORTTIME=30


# Background process to go on after killing shell
setopt AUTO_CONTINUE

# Play safe!
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'
alias define='~/Dropbox/codeBank/bash/define.sh'

# Typing errors...
alias 'cd..=cd ..'

# SSH aliases

#lastef= "$(ls -lrt | egrep -v '^d' | tail -1 | awk '{print $9}')"

# virtual envs
function activate() {
    if [ $# -ne 1 ]
    then
        echo "activate takes exactly one argument"
    else
        source ~/virt_env/$1/bin/activate
    fi
}

alias "vimlast=vim $(ls -lrt | tail -1 | awk '{print $9}')"

alias "lf=ls -l | egrep -v '^d'"
alias "ldir=ls -l | egrep '^d'"

export PATH=/Users/pouria/anaconda/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Tell the terminal about the working directory whenever it changes.
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]]; then

    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL, including
        # the host name to disambiguate local vs. remote paths.

        # Percent-encode the pathname.
        local URL_PATH=''
        {
            # Use LANG=C to process text byte-by-byte.
            local i ch hexch LANG=C
            for ((i = 1; i <= ${#PWD}; ++i)); do
                ch="$PWD[i]"
                if [[ "$ch" =~ [/._~A-Za-z0-9-] ]]; then
                    URL_PATH+="$ch"
                else
                    hexch=$(printf "%02X" "'$ch")
                    URL_PATH+="%$hexch"
                fi
            done
        }

        local PWD_URL="file://$HOST$URL_PATH"
        #echo "$PWD_URL"        # testing
        printf '\e]7;%s\a' "$PWD_URL"
    }

    # Register the function so it is called whenever the working
    # directory changes.
    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd

    # Tell the terminal about the initial directory.
    update_terminal_cwd
fi

# temporary aliases
alias -g tez=~/Dropbox/currentWork/thesis
