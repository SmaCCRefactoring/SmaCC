generated-initialization
initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(90 '->' 64) #(90 '...' 55) #(90 '==' 10) #(86 'Protocol' 56) #(86 'Type' 57) #(86 '__COLUMN__' 51) #(86 '__FILE__' 44) #(86 '__FUNCTION__' 50) #(86 '__LINE__' 47) #(86 'as' 48) #(86 'associativity' 75) #(86 'break' 34) #(86 'case' 42) #(86 'class' 4) #(86 'continue' 37) #(86 'convenience' 54) #(86 'default' 35) #(86 'deinit' 72) #(86 'didSet' 66) #(86 'do' 26) #(86 'dynamicType' 60) #(86 'else' 29) #(86 'enum' 14) #(86 'extension' 71) #(86 'fallthrough' 20) #(86 'for' 28) #(86 'func' 16) #(86 'get' 70) #(86 'if' 30) #(86 'import' 18) #(86 'in' 22) #(86 'infix' 78) #(86 'init' 68) #(86 'inout' 74) #(86 'is' 53) #(86 'left' 76) #(86 'let' 32) #(86 'mutating' 3) #(86 'none' 62) #(86 'nonmutating' 1) #(86 'operator' 80) #(86 'override' 2) #(86 'postfix' 83) #(86 'precedence' 77) #(86 'prefix' 81) #(86 'protocol' 12) #(86 'return' 11) #(86 'right' 79) #(86 'self' 61) #(86 'set' 73) #(86 'static' 5) #(86 'struct' 15) #(86 'subscript' 82) #(86 'super' 59) #(86 'switch' 40) #(86 'typealias' 21) #(86 'unowned' 9) #(86 'var' 13) #(86 'weak' 17) #(86 'where' 33) #(86 'while' 23) #(86 'willSet' 67))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap