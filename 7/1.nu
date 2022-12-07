#!/usr/bin/env nu

pwd | do { |pwd| mkdir files; cd files; open ../input | split row "\n" | each { |i| $i | split row ' ' | if ($in | length) == 2 && $in.0 != '$' { if $in.0 == 'dir' { mkdir $in.1 } else { $in | do { |j| $j.0 | save $j.1 } $in } } else if $in.1 == 'cd' { cd $'./($in.2)' } }; cd $pwd } $in

pwd | do { |pwd| mkdir files; cd files; open ../input | split row "\n" | each { |i| $i | split row ' ' | if ($in | length) == 2 && $in.0 != '$' { if $in.0 == 'dir' { print $"mkdir ($in.1)" } else { $in | do { |j| print $"($j.0) | save ($j.1)" } $in } } else if $in.1 == 'cd' { print $"cd $'./($in.2)'" } }; cd $pwd } $in