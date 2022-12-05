#!/usr/bin/env nu

open input | { stacks: ($in | str substring [0 ($in | str index-of "\n\n")] | str replace -a '\[(\w)\] ?' '$1,' | str replace -a '    ' ';,' | str replace -a ' ' '' | split row "\n" | split column -c ',' | drop 1 | transpose -i | each { |i,j| transpose key value | where value != ';' | get value | reverse } ), commands: ($in | str substring [($in | str index-of "\n\n") -1] | str replace -a 'move ' '' | str replace -a ' from ' ',' | str replace -a ' to ' ',' | $"num,src,dst\n($in)" | from csv) } | each { |i| $i.commands | reduce -f $i.stacks { |j, acc| $acc | each { |s, n| if ($n + 1) == $j.src { $s | drop $j.num } else if ($n + 1) == $j.dst { $s | append ($acc | get ($j.src - 1) | last $j.num) } else { $s } } } } | each { |i| $i | last } | str join
