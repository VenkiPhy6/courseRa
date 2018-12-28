#Often used with grep, grepl, sub, gsub

# ^ - start
# [^] - not the characters in this set 
# $ - end
# [][][][] - anything in the set of characters anywhere
# [0-9][a-z][A-Z] - specifying ranges
# . - placeholder for any single character
# | - or
# ? - optional
# \ - escape a metacharacter
# * - any number of repitions of something including no occurence. It is greedy.
# + - atleast one instance of some set
# {x} - must match exactly x times
# {x,} - must match atleast x times
# {x,y} - must match atleast x times and only upto y times
# \x - the xth parantheses 