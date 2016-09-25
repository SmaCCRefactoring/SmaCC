generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(71 'and' 66) #(71 'as' 10) #(71 'assert' 39) #(71 'break' 7) #(71 'class' 47) #(71 'continue' 8) #(71 'def' 24) #(71 'del' 1) #(71 'elif' 60) #(71 'else' 57) #(71 'except' 69) #(71 'exec' 18) #(71 'finally' 61) #(71 'for' 55) #(71 'from' 12) #(71 'global' 11) #(71 'if' 59) #(71 'import' 15) #(71 'in' 36) #(71 'is' 52) #(71 'lambda' 68) #(71 'not' 65) #(71 'or' 70) #(71 'pass' 2) #(71 'print' 3) #(71 'raise' 14) #(71 'return' 17) #(71 'try' 56) #(71 'while' 62) #(71 'with' 63) #(71 'yield' 13))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap