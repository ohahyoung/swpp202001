define i32 @count_even(i32* %arr, i32 %N) {
  ; Count the number of evens from
  ; %arr[0 … %N - 1]
  ; precond: 0 <= N <= 20
  entry:
   br label %loop

  loop:
   %i = phi i32 [0,%entry],[%nextval,%loop]
   %cnt = phi i32 [0,%entry],[%countup,%loop]
   %arrayidx = getelementptr i32, i32* %arr,i32 %i
   %0 = load i32, i32* %arrayidx
   %1 = and i32 %0,1
   %2 = xor i32 %1,1
   %countup = add i32 %2, %cnt
   %nextval = add i32 %i, 1
   %loopcond = icmp ult i32 %i, %N
   br i1 %loopcond, label %loop, label %afterloop

  afterloop:
   ret i32 %cnt    
}
