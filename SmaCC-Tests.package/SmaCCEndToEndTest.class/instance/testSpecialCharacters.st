tests
testSpecialCharacters
	| parserCompiler maxValue |
	[ String with: (Character value: 16rFF00) ]
		on: Error
		do: [ :ex | ^ self ].	"Unicode characters not supported"
	maxValue := SmaCCGrammar maximumCharacterValue.
	SmaCCGrammar maximumCharacterValue: 65535.
	[ (parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<name> : \x3g \x20 \xFF \xFF1 \xFF00 \cC;
			begin ::= <name> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			(self parserClass
				parse:
					(String
						withAll:
							(#(3 103 16r20 16rFF 16rFF1 16rFF00 2)
								collect: [ :each | Character value: each ]))) ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]