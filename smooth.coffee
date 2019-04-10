pl = require '/home/me/stf/sandbox/coffees/pl.js'
pl.installPrelude global

# general: is, isnt, until, loop, unless

cl = (s) -> console.log(s)
nl = ()  -> console.log("")
sq = (x) -> x * x

# p33, for / comprehension
cl("'for' example, pythony type comprehension: ")
# for n in [1..6] by 2 then cl(n)
((n) -> if even(n) then cl(n) else cl(sq n))(n) for n in [1..15] by 3
# cl(n) for n in [1..6] by 2
nl()
# eqModK is true iff a = b (mod k).
eqModK = (a, b, k) -> (mod a, k) == (mod b, k)
# eqClass returns the set of n in [a]_j (where [a]_j represents the [ x | x ~ a (mod j)])
# and in [b]_k that are also in the range [a..ub], ub = "upper bound".
eqClass = (a, j, b, k, ub) -> (i for i in [a..ub] by j when eqModK(i, b, k))
let xs = eqClass(1, 3, 2, 5, 100)
# => [ 7, 22, 37, 52, 67, 82, 97 ], that is,
# all n in [1]_3 and [2]_5 and in the range [1..100].
# Not the most efficient way, but it'll git-r-done nevertheless and
# illustrates most of the CS list comprehension features.
# Generally (expr(i) for i in list [by j] [when pred(i, xs*)]), and note that "if" won't work where
# like it would in python.

# Exercise 6, p38 (variation to check if random values are realistic)
((xs) -> [maximum(xs), minimum(xs)]) map [1..100], ( (x) -> Math.floor Math.random() * 6 + 1)

###
cl("next")
###

cl("end")
