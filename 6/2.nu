#!/usr/bin/env nu

open input | each { |i| seq 0 (($i | str length) - 14) | par-each { |j| if ($i | str substring [$j ($j + 14)] | split chars | uniq | length) == 14 { $j } } } | get 0 | ($in | math min) + 14
