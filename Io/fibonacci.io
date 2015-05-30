fib_iterative := method(
  number, 
  if(number <= 0) then(return "Invalid input") elseif(number == 1 or number == 2) then(return 1) else(
    n_minus1 := 1; 
    n_minus2 := 1;
    current := 3;
    temp := 0;
    while(current < number, 
      temp = n_minus2; 
      n_minus2 = n_minus1; 
      n_minus1 = n_minus2 + temp; 
      current = current + 1);
    return n_minus2 + n_minus1
  )
)

fib_recursive := method(
  number,
  if(number <= 0) then(return "Invalid input") elseif(number == 1 or number == 2) then(return 1) else(
    return fib_recursive(number - 1) + fib_recursive(number - 2)
  )
)

"fib_iterative" println
for(i, 1, 10, fib_iterative(i) println)

"fib_recursive" println
for(i, 1, 10, fib_recursive(i) println)