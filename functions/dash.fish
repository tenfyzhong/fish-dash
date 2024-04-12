function dash --description 'open dash to search docset'
    argparse 'h/help' -- $argv 2>/dev/null
    if test $status -ne 0
        return 1
    end

    if set -q _flag_help
        _dash_help
        return 0
    end

    if test -z "$argv"
        return 2
    end

    set -l keyword (string join ' ' $argv)
    set -l keyword (string escape --style=url $keyword)
    open dash://$keyword
end

function _dash_help
    printf %s\n \
        'dash: open dash to search docset' \
        'Usage: dash <opts> keyword' \
        '' \
        'Options:'\
        '  -h/--help               print this help message'
end
