SquareList := List clone
SquareList asString := method(
  s := "["
  self foreach(
    index, 
    num, 
    if(index == 0, 
      s = s ..(num),
      s = s ..(", ") ..(num)))
  s = s ..("]")
)

squareBrackets := method(
  l := SquareList clone
  call message arguments foreach(
  arg,
  l append(arg))
  l
)

a := [1, 2, 3]
a asString println
a at(0) println

b := []
b asString println