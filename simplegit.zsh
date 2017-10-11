# simple git prompt function for BASH and ZSH. No fancy colors
# by default, just displaying the branch and
# staged/modified/unknown state
# (c) Rob Wolfram <propdf@hamal.nl>
# Added to public domain.

# Legend:
# (branch|flags)
# branch can be followed by "<" (you're behind remote origin), ">" (you're
# ahead of remote origin) or both.
# Flags:
# .    nothing to commit
# X    there are conflicts
# +    files are staged
# *    files are modified
# ?    untracked files are present

# Usage:
# ZSH: include the following in your .zshrc file (the ellipses denote
# your own part of PROMPT):
#  setopt PROMPT_SUBST
#  source /path/to/simplegit.zsh
#  export PROMPT='...$(__simplegit)...'
# BASH: include the following in your .bashrc (the ellipses denote
# your own part of PS1):
#  source /path/to/simplegit.bash
#  PS1='...$(__simplegit)...'
#
# To add colors, export the variable SIMPLEGITCOLORS with a non-empty
# string. If you want brighter colors on an dark background, export
# the non-empty variable SGITDARK as well.

__simplegit() {
    (
        if [ -n "$SIMPLEGITCOLORS" ] ; then
            [ -n "$SGITDARK" ] && HL=';1'
            __RED="\033[31${HL}m"
            __GREEN="\033[32${HL}m"
            __YELLOW="\033[33${HL}m"
            __MGTA="\033[35${HL}m"
            __CYAN="\033[36${HL}m"
            __RESET="\033[0m"
        else
            __RED=''
            __GREEN=''
            __YELLOW=''
            __MGTA=''
            __CYAN=''
            __RESET=''
        fi
        declare -a __mystatlines
        __mybr=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        [ -n "$__mybr" ] || return
        __mystat=$(git status --porcelain 2>/dev/null)
        [ -n "$ZSH_NAME" ] && __mystatlines=( ${(f)__mystat} )
        [ -n "$BASH" ] && readarray -t __mystatlines <<< "$__mystat"
        for line in ${__mystatlines[@]} ; do
            [ "${line:0:1}" = "U" ] && __sgbrk="${__RED}X${__RESET}"
            [ "${line:0:1}" = "A" -o "${line:0:1}" = "M" ] && \
                __sgadd="${__CYAN}+${__RESET}"
            [ "${line:1:1}" = "M" ] && __sgmod="${__YELLOW}*${__RESET}"
            [ "${line:1:1}" = "?" ] && __sgunk="${__MGTA}?${__RESET}"
        done
        if [ -n "${__sgbrk}" ] ; then
            __mybr="${__RED}${__mybr}${__RESET}"
        elif [ -n "${__sgmod}" ] ; then
            __mybr="${__YELLOW}${__mybr}${__RESET}"
        elif [ -n "${__sgadd}" ] ; then
            __mybr="${__CYAN}${__mybr}${__RESET}"
        elif [ -n "${__sgunk}" ] ; then
            __mybr="${__MGTA}${__mybr}${__RESET}"
        fi
        if [ -z "${__sgbrk}${__sgadd}${__sgmod}${__sgunk}" ] ; then
            __sgbrk="${__GREEN}.${__RESET}"
            __mybr="${__GREEN}${__mybr}${__RESET}"
            __mystat=$(git status 2>/dev/null)
            [[ "$__mystat" =~ Your.branch.*behind ]] && __rem="<"
            [[ "$__mystat" =~ Your.branch.*ahead ]] && __rem=">"
            [[ "$__mystat" =~ Your.branch.*diverged ]] && __rem="<>"
        fi
        echo "(${__mybr}${__rem}|${__sgbrk}${__sgadd}${__sgmod}${__sgunk})"
    )
}
