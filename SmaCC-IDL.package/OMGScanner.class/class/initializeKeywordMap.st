generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(62 'FALSE' 10) #(62 'TRUE' 14) #(62 'any' 48) #(62 'attribute' 31) #(62 'boolean' 50) #(62 'case' 55) #(62 'char' 47) #(62 'const' 29) #(62 'context' 9) #(62 'default' 53) #(62 'double' 15) #(62 'enum' 54) #(62 'exception' 33) #(62 'float' 8) #(62 'in' 43) #(62 'inout' 38) #(62 'interface' 16) #(62 'long' 34) #(62 'module' 22) #(62 'octet' 45) #(62 'oneway' 35) #(62 'out' 39) #(62 'raises' 37) #(62 'readonly' 30) #(62 'sequence' 46) #(62 'short' 49) #(62 'string' 40) #(62 'struct' 52) #(62 'switch' 57) #(62 'typedef' 28) #(62 'union' 56) #(62 'unsigned' 51) #(62 'void' 41))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap