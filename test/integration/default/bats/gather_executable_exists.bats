#!/usr/bin/env bats

@test "gather executable exists" {
    run test -x /usr/local/bin/gather
    [ "$status" -eq 0 ]
}

@test "run gather collect" {
    run /usr/local/bin/gather collect
    [ "$status" -eq 0 ]
}

@test "ensure db directory not empty" {
    result=$(ls -A /var/db/gather | wc -l)
    [ "$result" -gt 0 ]
}
