private
buildStructure
	"In there, if we have a pattern like `op{beToken}`, we will execute self beToken as well, after checking that the smalltalk code between curly braces is a correct Smalltalk expression, which limits a bit what can be written between the curly braces (but someone could write almost anything with a bit of creativity)."

	| index code source |
	isList := isToken := false.
	isNode := true.
	testBlock := [ :node | true ].
	index := value indexOf: ${.
	index > 0
		ifFalse: [ ^ self ].
	code := value copyFrom: index + 1 to: (value lastIndexOf: $}) - 1.
	"transform something like {beNode} in 'self beNode'."
	source := 'self ' , code.
	"Syntax checking."
	RBParser
		parseExpression: source
		onError: [ :s :p | self error: 'Invalid pattern expression' ].
	"evaluate..."
	Compiler evaluate: source for: self logged: false