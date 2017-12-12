accessing
isExpressions
	| oldSize |
	oldSize := SmaCCGrammar maximumCharacterValue.
	^ [ SmaCCGrammar
		maximumCharacterValue: SmaCCGrammar maximumUnicodeCharacterValue.
	SmaCCGrammar isExpressionMap ]
		ensure: [ SmaCCGrammar maximumCharacterValue: oldSize ]