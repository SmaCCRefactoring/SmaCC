private
buildStructure
	| index code |
	isList := isToken := false.
	isNode := true.
	testBlock := [ :node | true ].
	index := value indexOf: ${.
	index > 0
		ifFalse: [ ^ self ].
	code := value copyFrom: index + 1 to: (value lastIndexOf: $}) - 1.
	Compiler evaluate: 'self ' , code for: self logged: false