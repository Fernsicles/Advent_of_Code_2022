#!/usr/bin/env nu

open input | str replace -a '-' ',' | from csv -n | where { |i| ($i.column1 >= $i.column3 && $i.column2 <= $i.column4) || ($i.column1 <= $i.column3 && $i.column2 >= $i.column4) } | length
