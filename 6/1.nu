#!/usr/bin/env nu

open input | each { |i| seq 0 (($i | str length) - 4) | par-each { |j| if ($i | str substring [$j ($j + 4)] | split chars | uniq | length) == 4 { $j } } } | get 0 | ($in | math min) + 4
