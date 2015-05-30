# Q3. Add up all the numbers in a two-dimensional array

add_grid := method(
  grid,
  sum := 0;
  grid foreach(row, row foreach(element, sum = sum + element));
  return sum
)


a := list(1, 2, 3)
b := list(4, 5, 6, 7)
c := list(8, 9)
d := list(10)
e := list(a, b, c, d)
  
"Sum of grid elements is " print
add_grid(e) println



# Q4. Average of numbers in a list

List average := method(
  if(self size == 0, return 0)
  sum := 0;
  try
  self foreach(element, sum = sum + element);
  return sum / (self size)
)

"Average of numbers is " print
(list(1,2) average) println



# Q5. Prototype for a two-dimensional list

Matrix := Object clone
Matrix matrix := List clone
Matrix dim := method(
  x, y,
  for(i, 1, y, a := List clone; for(j, 1, x, a append(0)); matrix append(a));
)

Matrix set := method(
  x, y, value,
  (matrix at(y)) atPut(x, value)
)

Matrix get := method(
  x, y,
  return (matrix at(y)) at(x)
)

Matrix transpose := method(
  trans := List clone;
  x_size := matrix size;
  y_size := (matrix at(0)) size;
  for(i, 0, y_size - 1, a := List clone; for (j, 0, x_size - 1, a append(self get(i,j))); trans append(a));
  return trans
)

myMatrix := Matrix clone
myMatrix dim(4, 5)
myMatrix set(1, 1, "21")
"Item at (1, 1): " print
myMatrix get(1, 1) println

"   " println

myMatrix set(3, 2, "1")
myMatrix set(0, 3, "4")
myMatrix set(2, 4, "19")
myMatrix set(1, 2, "6")
myMatrix set(0, 1, "11")
myMatrix matrix foreach(element, element foreach(number, number print; "\t" print); "" println)

"   " println

transposeMatrix := myMatrix transpose
transposeMatrix foreach(element, element foreach(number, number print; "\t" print); "" println)