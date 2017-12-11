generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(76 'auto' 70) #(76 'break' 48) #(76 'case' 38) #(76 'char' 73) #(76 'const' 40) #(76 'continue' 47) #(76 'default' 39) #(76 'do' 54) #(76 'double' 60) #(76 'else' 46) #(76 'enum' 51) #(76 'extern' 58) #(76 'float' 67) #(76 'for' 49) #(76 'goto' 50) #(76 'if' 42) #(76 'int' 69) #(76 'long' 66) #(76 'register' 71) #(76 'return' 13) #(76 'short' 68) #(76 'signed' 56) #(76 'sizeof' 24) #(76 'static' 61) #(76 'struct' 43) #(76 'switch' 52) #(76 'typedef' 57) #(76 'union' 44) #(76 'unsigned' 55) #(76 'void' 72) #(76 'volatile' 41) #(76 'while' 53))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap