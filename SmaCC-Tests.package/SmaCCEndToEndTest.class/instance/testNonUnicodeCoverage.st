tests-unicode
testNonUnicodeCoverage
	"This test shows that even with a non-unicode option, the regular expression . covers the full unicode spectrum."

	| parserCompiler maxValue |
	[ String with: (Character value: 16rFF00) ]
		on: Error
		do: [ :ex | ^ self ].	"Unicode characters not supported"
	maxValue := SmaCCGrammar maximumCharacterValue.
	[ (parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<hash> : \#;
			<anything> : .;
			begin : <hash> <anything> + {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: '#→') ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]