# simple git prompt function for BASH and ZSH. No fancy colors, just displaying
# the branch and staged/modified/unknown state
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

__simplegit() {
    (
        declare -a __mystatlines
        __mybr=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        [ -n "$__mybr" ] || return
        __mystat=$(git status --porcelain 2>/dev/null)
        [ -n "$ZSH_NAME" ] && __mystatlines=( ${(f)__mystat} )
        [ -n "$BASH" ] && readarray -t __mystatlines <<< "$__mystat"
        for line in ${__mystatlines[@]} ; do
            [ "${line:0:1}" = "U" ] && __sgbrk="X"
            [ "${line:0:1}" = "A" -o "${line:0:1}" = "M" ] && __sgadd="+"
            [ "${line:1:1}" = "M" ] && __sgmod="*"
            [ "${line:1:1}" = "?" ] && __sgunk="?"
        done
        if [ -z "${__sgbrk}${__sgadd}${__sgmod}${__sgunk}" ] ; then
            __sgbrk="."
            __mystat=$(git status 2>/dev/null)
            [[ "$__mystat" =~ Your.branch.*behind ]] && __rem="<"
            [[ "$__mystat" =~ Your.branch.*ahead ]] && __rem=">"
            [[ "$__mystat" =~ Your.branch.*diverged ]] && __rem="<>"
        fi
        echo "(${__mybr}${__rem}|${__sgbrk}${__sgadd}${__sgmod}${__sgunk})"
    )
}
