generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(76 'auto' 72) #(76 'break' 48) #(76 'case' 39) #(76 'char' 68) #(76 'const' 41) #(76 'continue' 47) #(76 'default' 42) #(76 'do' 54) #(76 'double' 51) #(76 'else' 25) #(76 'enum' 40) #(76 'extern' 65) #(76 'float' 61) #(76 'for' 49) #(76 'goto' 50) #(76 'if' 46) #(76 'int' 66) #(76 'long' 67) #(76 'register' 73) #(76 'return' 19) #(76 'short' 69) #(76 'signed' 55) #(76 'sizeof' 28) #(76 'static' 70) #(76 'struct' 44) #(76 'switch' 52) #(76 'typedef' 58) #(76 'union' 45) #(76 'unsigned' 43) #(76 'void' 71) #(76 'volatile' 38) #(76 'while' 53))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap