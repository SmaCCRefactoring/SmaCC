private
buildStructure
	| index code source |
	isList := isToken := false.
	isNode := true.
	testBlock := [ :node | true ].
	index := value indexOf: ${.
	index > 0
		ifFalse: [ ^ self ].
	code := value copyFrom: index + 1 to: (value lastIndexOf: $}) - 1.
	source := 'self ' , code.
	RBParser parseExpression: source onError: [ :s :p | self error: 'Invalid pattern expression' ].
	Compiler evaluate: source for: self logged: false