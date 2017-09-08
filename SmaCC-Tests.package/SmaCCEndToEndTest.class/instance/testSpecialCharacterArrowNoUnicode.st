tests
testSpecialCharacterArrowNoUnicode
	| parserCompiler maxValue |
	[ String with: (Character value: 16rFF00) ]
		on: Error
		do: [ :ex | ^ self ].	"Unicode characters not supported"
	maxValue := SmaCCGrammar maximumCharacterValue.
	[ (parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<arrow> : →;
			begin : <arrow> + {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self should: [ self parserClass parse: '→' ] raise: SmaCCParserError ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]