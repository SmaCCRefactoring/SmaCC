constructing
makeCaseInsensitive
	| newCharacters |
	ignoreCase := true.
	newCharacters := characters copy.
	characters
		do: [ :each | 
			| upper lower |
			upper := each asUppercase.
			lower := each asLowercase.
			upper asInteger > SmaCCGrammar maximumCharacterValue
				ifFalse: [ newCharacters add: upper ].
			lower asInteger > SmaCCGrammar maximumCharacterValue
				ifFalse: [ newCharacters add: lower ] ].
	characters := newCharacters