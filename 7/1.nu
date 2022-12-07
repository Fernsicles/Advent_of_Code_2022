#!/usr/bin/env nu

do { |pwd| mkdir files; cd files; open ../input | split row "\n" | reduce -f (pwd) { |i acc| cd $acc; $i | split row ' ' | if ($in | length) == 2 && $in.0 != '$' { if $in.0 == 'dir' { mkdir ($in.1) } else { $in | do { |j| $j.0 | save $'($acc)/($j.1)' } $in } } else if $in.1 == 'cd' { cd $'./($in.2)' }; pwd } }
