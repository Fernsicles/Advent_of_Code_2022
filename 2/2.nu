#!/usr/bin/env nu

open input | str replace -a X A | str replace -a Y B | str replace -a Z C | from csv --separator ' ' --noheaders | each { |i| { opp: ($i.column1 | into int -r 16 | $in - 9), res: ($i.column2 | into int -r 16 | ($in - 10) * 3) } } | each { |i| ([[opp res own]; [1 0 3] [1 3 1] [1 6 2] [2 0 1] [2 3 2] [2 6 3] [3 0 2] [3 3 3] [3 6 1]] | where opp == $i.opp && res == $i.res | get 0.own) + $i.res } | math sum
