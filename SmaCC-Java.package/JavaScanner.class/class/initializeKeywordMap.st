generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(105 'abstract' 37) #(105 'assert' 83) #(105 'boolean' 32) #(105 'break' 82) #(105 'byte' 33) #(105 'case' 58) #(105 'catch' 75) #(105 'char' 25) #(105 'class' 8) #(105 'continue' 77) #(105 'default' 14) #(105 'do' 80) #(105 'double' 27) #(105 'else' 31) #(105 'enum' 13) #(105 'extends' 9) #(105 'false' 101) #(105 'final' 38) #(105 'finally' 76) #(105 'float' 26) #(105 'for' 81) #(105 'if' 16) #(105 'implements' 10) #(105 'import' 43) #(105 'instanceof' 57) #(105 'int' 29) #(105 'interface' 18) #(105 'long' 30) #(105 'native' 39) #(105 'new' 92) #(105 'null' 104) #(105 'package' 35) #(105 'private' 41) #(105 'protected' 46) #(105 'public' 45) #(105 'return' 78) #(105 'short' 34) #(105 'static' 42) #(105 'strictfp' 7) #(105 'super' 17) #(105 'switch' 47) #(105 'synchronized' 40) #(105 'this' 22) #(105 'throw' 84) #(105 'throws' 21) #(105 'transient' 23) #(105 'true' 101) #(105 'try' 74) #(105 'void' 11) #(105 'volatile' 24) #(105 'while' 79))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap