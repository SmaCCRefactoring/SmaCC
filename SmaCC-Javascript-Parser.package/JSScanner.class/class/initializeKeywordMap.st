generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(85 'break' 43) #(85 'case' 49) #(85 'catch' 60) #(85 'const' 74) #(85 'continue' 44) #(85 'debugger' 53) #(85 'default' 48) #(85 'delete' 32) #(85 'do' 58) #(85 'else' 26) #(85 'false' 12) #(85 'finally' 54) #(85 'for' 59) #(85 'function' 51) #(85 'get' 36) #(85 'if' 62) #(85 'in' 14) #(85 'instanceof' 20) #(85 'let' 75) #(85 'new' 34) #(85 'null' 52) #(85 'of' 50) #(85 'return' 41) #(85 'set' 37) #(85 'switch' 45) #(85 'this' 27) #(85 'throw' 56) #(85 'true' 55) #(85 'try' 57) #(85 'typeof' 19) #(85 'var' 71) #(85 'void' 35) #(85 'while' 46) #(85 'with' 42) #(84 'break' 43) #(84 'case' 49) #(84 'catch' 60) #(84 'const' 74) #(84 'continue' 44) #(84 'debugger' 53) #(84 'default' 48) #(84 'delete' 32) #(84 'do' 58) #(84 'else' 26) #(84 'false' 12) #(84 'finally' 54) #(84 'for' 59) #(84 'function' 51) #(84 'get' 36) #(84 'if' 62) #(84 'in' 14) #(84 'instanceof' 20) #(84 'let' 75) #(84 'new' 34) #(84 'null' 52) #(84 'of' 50) #(84 'return' 41) #(84 'set' 37) #(84 'switch' 45) #(84 'this' 27) #(84 'throw' 56) #(84 'true' 55) #(84 'try' 57) #(84 'typeof' 19) #(84 'var' 71) #(84 'void' 35) #(84 'while' 46) #(84 'with' 42))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap