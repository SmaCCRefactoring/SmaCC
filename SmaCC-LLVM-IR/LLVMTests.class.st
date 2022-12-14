"
Where tests are linked.

"
Class {
	#name : #LLVMTests,
	#superclass : #TestCase,
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #resources }
LLVMTests class >> example1 [
	^ 'define i32 @mul_add(i32 %x, i32 %y, i32 %z) {
  %tmp = mul i32 %x, %y
  %tmp2 = add i32 %tmp, %z
  ret i32 %tmp2
}'
]

{ #category : #resources }
LLVMTests class >> example2 [
	^ '; Declare the string constant as a global constant.
@.str = private unnamed_addr constant [13 x i8] c"hello world\0A\00"

; External declaration of the puts function
declare i32 @puts(i8* nocapture) nounwind

; Definition of main function
define i32 @main() {   ; i32()*
  ; Convert [13 x i8]* to i8  *...
  %cast210 = getelementptr [13 x i8]* @.str, i64 0, i64 0

  ; Call puts function to write out the string to stdout.
  call i32 @puts(i8* %cast210)
  ret i32 0
}

; Named metadata
!0 = metadata !{i32 42, null, metadata !"string"}
!foo = !{!0}

'
]
