resources
example1
	^ 'define i32 @mul_add(i32 %x, i32 %y, i32 %z) {
  %tmp = mul i32 %x, %y
  %tmp2 = add i32 %tmp, %z
  ret i32 %tmp2
}'