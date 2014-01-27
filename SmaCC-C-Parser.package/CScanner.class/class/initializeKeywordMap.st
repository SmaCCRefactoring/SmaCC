generated
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(76 'auto' 63) #(76 'break' 37) #(76 'case' 38) #(76 'char' 68) #(76 'const' 40) #(76 'continue' 48) #(76 'default' 45) #(76 'do' 49) #(76 'double' 55) #(76 'else' 44) #(76 'enum' 41) #(76 'extern' 64) #(76 'float' 73) #(76 'for' 50) #(76 'goto' 47) #(76 'if' 51) #(76 'int' 66) #(76 'long' 67) #(76 'register' 71) #(76 'return' 65) #(76 'short' 69) #(76 'signed' 46) #(76 'sizeof' 32) #(76 'static' 70) #(76 'struct' 43) #(76 'switch' 53) #(76 'typedef' 57) #(76 'union' 42) #(76 'unsigned' 52) #(76 'void' 72) #(76 'volatile' 39) #(76 'while' 54))
		do: [:each | (keywordMap at: each first ifAbsentPut: [Dictionary new]) at: (each at: 2) put: each last].
	^keywordMap