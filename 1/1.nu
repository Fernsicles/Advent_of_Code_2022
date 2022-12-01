#!/usr/bin/env nu

open input | sed -Ez 's/\n\n/ /g' | tr '\n' ',' | tr ' ' '\n' | lines | split column -c ',' | each { |a, b| echo $a | rotate | get column0 | into int | math sum } | math max