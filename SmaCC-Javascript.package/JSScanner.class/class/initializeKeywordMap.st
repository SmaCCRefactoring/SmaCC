generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(81 'break' 42) #(81 'case' 44) #(81 'catch' 56) #(81 'continue' 47) #(81 'debugger' 52) #(81 'default' 48) #(81 'delete' 31) #(81 'do' 49) #(81 'else' 25) #(81 'false' 34) #(81 'finally' 57) #(81 'for' 46) #(81 'function' 53) #(81 'get' 35) #(81 'if' 63) #(81 'in' 14) #(81 'instanceof' 13) #(81 'new' 32) #(81 'null' 50) #(81 'return' 43) #(81 'set' 36) #(81 'switch' 41) #(81 'this' 26) #(81 'throw' 58) #(81 'true' 51) #(81 'try' 55) #(81 'typeof' 10) #(81 'var' 70) #(81 'void' 15) #(81 'while' 54) #(81 'with' 40))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap