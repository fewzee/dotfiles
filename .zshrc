# auto tab completion
autoload -U compinit
compinit
 
# simple prompt
# PROMPT="%n@%m:%~> "
autoload -U promptinit
promptinit
prompt redhat

# zmv provides regex options for mv
autoload -U zmv

# report process time if took longer than x seconds
export REPORTTIME=10

# background process to go on after killing shell
setopt AUTO_CONTINUE

# safe remove
alias 'rm=rm -i'

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

# dictionary
alias define='~/Dropbox/codeBank/bash/define.sh'

# vim the most recently modified/created file
alias "vimlast=vim $(ls -lrt | tail -1 | awk '{print $9}')"

# list only files
alias "lf=ls -l | egrep -v '^d'"

# list only directories
alias "ldir=ls -l | egrep '^d'"

# homebrew
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
