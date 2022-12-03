#!/usr/bin/env nu

open input | str replace -a "(([A-z]+\n){3})" "$1," | split row ',' | split column "\n" a b c | each { |i| $i.a | split chars | where { |j| ($i.b | str contains $j) && ($i.c | str contains $j) } | get 0 | if ($in | find -r "[A-Z]") != $nothing { $in | into int -r 36 | $in + 17 } else { $in | into int -r 36 | $in - 9 } } | math sum
