pl = require '/home/me/stf/sandbox/coffees/pl.js'
pl.installPrelude global

cl = (s) -> console.log(s)

xs = [0..3]

# car = (first, rest...) -> first
# cdr = (first, rest...) -> rest
car = (xs) -> xs[0]
cdr = (xs) -> xs[1..]
emptyQ = (xs) -> (xs.length == 0)

# Traditional C/Java style switch:
pow = (Base, Expt) ->
  switch Expt
    when 0 then return 1 # return statements are superfluous in CS, unlike JS, see pow2 below
    when 1 then return Base
    else return Base * pow(Base, Expt - 1)

# Racket/scheme/lisp style cond as CS switch:
pow2 = (Base, Expt) ->
  switch
    when Expt == 0 then 1
    when Base == 0 then 0 # Prolly don't need this but it eliminates needless recursion for say, 0^1000.
    when Expt == 1 then Base # Ditto
    else Base * pow2(Base, Expt - 1)

len = (xs) ->
  switch
    when emptyQ(xs) then 0
    when emptyQ(cdr(xs)) then 1
    else 1 + len(cdr(xs))

cl("length of xs = #{len(xs)}")
cl("2^10 = #{pow2(2,10)}")
cl("0^0 = #{pow2(0, 0)}")

# array slicing and splicing with ranges from CS.org, lang ref
xs = [1..6]
xs[1..3] = [9, 8] # replacing 3 elements by splicing in 2
# now xs = [ 1, 9, 8, 5, 6 ]
# Can also elide array elements, e.g. in quicksort:
qs = (xs) -> # Canonical "Ooooooh... aaaaaaah..." example for why functional programming is freakin' aMAZing
  switch xs.length
    when 0, 1 then return xs
    else
      [ pivot, rest ] = [ xs[0], xs[1..] ]
      parts = partition rest, (x) -> x < pivot # parts[0] = "less than pivot", parts[1] greater
      [ lessThanPivot, greaterOrEq ] = [ qs(parts[0]), qs(parts[1]) ] # not needed, just for clarity
      [ lessThanPivot..., pivot, greaterOrEq... ]

# xs = [76, 42, 0, 867, 99]
xs = [1,3,2]
cl(qs([]))
cl(qs([1]))
cl(qs([2,1]))
cl(qs([1, 3, 2]))
cl(qs([4,3,2,1]))
