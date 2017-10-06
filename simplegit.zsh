# simple git prompt function for BASH and ZSH. No fancy colors, just displaying
# the branch and staged/modified/unknown state
# (c) Rob Wolfram <propdf@hamal.nl>
# Added to public domain.

__simplegit() {
    (
        declare -a __mystatlines
        __mybr=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        [ -n "$__mybr" ] || return
        __mystat=$(git status --porcelain 2>/dev/null)
        [ -n "$ZSH_NAME" ] && __mystatlines=( ${(f)__mystat} )
        [ -n "$BASH" ] && readarray -t __mystatlines <<< "$__mystat"
        __sgadd=""
        __sgmod=""
        __sgunk=""
        for line in ${__mystatlines[@]} ; do
            [ "${line:0:1}" = "A" -o "${line:0:1}" = "M" ] && __sgadd="+"
            [ "${line:1:1}" = "M" ] && __sgmod="*"
            [ "${line:1:1}" = "?" ] && __sgunk="?"
            [ -n "$__sgadd" -a -n "$__sgmod" -a -n "$__sgunk" ] && break
        done
        echo "(${__mybr}|${__sgadd}${__sgmod}${__sgunk})"
    )
}
