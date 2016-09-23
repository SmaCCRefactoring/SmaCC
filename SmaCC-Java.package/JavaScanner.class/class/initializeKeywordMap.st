generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(104 'abstract' 37) #(104 'assert' 84) #(104 'boolean' 32) #(104 'break' 82) #(104 'byte' 35) #(104 'case' 58) #(104 'catch' 77) #(104 'char' 25) #(104 'class' 8) #(104 'continue' 76) #(104 'default' 14) #(104 'do' 80) #(104 'double' 29) #(104 'else' 31) #(104 'enum' 15) #(104 'extends' 11) #(104 'false' 100) #(104 'final' 38) #(104 'finally' 78) #(104 'float' 26) #(104 'for' 83) #(104 'if' 24) #(104 'implements' 10) #(104 'import' 43) #(104 'instanceof' 56) #(104 'int' 28) #(104 'interface' 36) #(104 'long' 27) #(104 'native' 41) #(104 'new' 92) #(104 'null' 103) #(104 'package' 33) #(104 'private' 40) #(104 'protected' 46) #(104 'public' 47) #(104 'return' 81) #(104 'short' 34) #(104 'static' 39) #(104 'strictfp' 7) #(104 'super' 16) #(104 'switch' 48) #(104 'synchronized' 42) #(104 'this' 22) #(104 'throw' 73) #(104 'throws' 23) #(104 'transient' 18) #(104 'true' 100) #(104 'try' 74) #(104 'void' 9) #(104 'volatile' 12) #(104 'while' 79))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap