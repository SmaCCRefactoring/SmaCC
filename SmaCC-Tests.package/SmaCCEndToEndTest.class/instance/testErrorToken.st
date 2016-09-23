tests
testErrorToken
	| parserCompiler countingBlock |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<name> : [a-zA-Z]+; <whitespace>: \s+;
			%left "+"; Expression : <name> | Expression "+" Expression {[Notification signal] on: Error do: [:ex | ex return: (Notification raise)]} | error "+" Expression ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	countingBlock := [ :string | 
	| count |
	count := 0.
	[ [ self parserClass parse: string ]
		on: Notification
		do:
			[ :ex | 
			count := count + 1.
			[ ex resume ]
				on: Error
				do: [ :ex1 | 
					ex isResumable: true.
					ex1 retry ] ] ]
		on: SmaCCParserError
		do: [ :ex | ex return ].
	count ].
	#(#('a + b + c' 2) #('+ a + b + c' 2) #('a + b +' 1) #('a + 1 / 2 + b + c + 3' 2) #('1 + 1 / 2 + b + c + 3' 1))
		do: [ :each | self assert: (countingBlock value: each first) = each last ]