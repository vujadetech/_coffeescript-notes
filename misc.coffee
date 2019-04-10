
xs = [0..3]

# car = (first, rest...) -> first
# cdr = (first, rest...) -> rest
car = (xs) -> xs[0]
cdr = (xs) -> xs[1..]
emptyQ = (xs) -> return (xs.length == 0)

# Traditional C/Java style switch:
pow = (Base, Expt) ->
  switch Expt
    when 0 then return 1
    when 1 then return Base
    else return Base * pow(Base, Expt - 1)

# Racket/scheme/lisp style cond as CS switch:
pow2 = (Base, Expt) ->
  switch
    when Base == 0 then return 0
    when Expt == 0 then return 1
    when Expt == 1 then return Base
    else return Base * pow2(Base, Expt - 1)

len = (xs) ->
  switch
    when emptyQ(xs) then return 0
    when emptyQ(cdr(xs)) then return 1
    else return 1 + len(cdr(xs))

cl("length of xs = #{len(xs)}")
cl("2^10 = #{pow2(2,10)}")
