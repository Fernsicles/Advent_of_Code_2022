#!/usr/bin/env nu

open input | lines | each { |i| { a: ($i | str substring $"0,(($i | str length) / 2)"), b: ($i | str substring $"(($i | str length) / 2),($i | str length)") } } | each { |i| $i.a | split chars | where { |j| $i.b | str contains $j } | get 0 | if ($in | find -r "[A-Z]") != $nothing { $in | into int -r 36 | $in + 17 } else { $in | into int -r 36 | $in - 9 } } | math sum
