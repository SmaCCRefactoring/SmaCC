generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(77 'and' 75) #(77 'as' 14) #(77 'assert' 29) #(77 'break' 5) #(77 'class' 51) #(77 'continue' 9) #(77 'def' 22) #(77 'del' 1) #(77 'elif' 64) #(77 'else' 65) #(77 'except' 63) #(77 'exec' 12) #(77 'finally' 59) #(77 'for' 61) #(77 'from' 18) #(77 'global' 11) #(77 'if' 49) #(77 'import' 17) #(77 'in' 34) #(77 'is' 45) #(77 'lambda' 67) #(77 'not' 76) #(77 'or' 73) #(77 'pass' 2) #(77 'print' 3) #(77 'raise' 16) #(77 'return' 19) #(77 'try' 62) #(77 'while' 66) #(77 'with' 60) #(77 'yield' 39))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap