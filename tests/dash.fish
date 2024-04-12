function open
    @test "open url should equal to $open1" $argv[1] = $open1
end

set -g open1 "dash://go%20fmt"
dash go fmt

@test 'help' (dash -h | string collect) = 'dash: open dash to search docset
Usage: dash <opts> keyword

Options:
  -h/--help               print this help message'

@test 'no argv' (dash) $status -eq 2
