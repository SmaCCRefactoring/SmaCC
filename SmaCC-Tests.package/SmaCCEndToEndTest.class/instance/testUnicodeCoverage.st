tests-unicode
testUnicodeCoverage
	| parserCompiler maxValue |
	[ String with: (Character value: 16rFF00) ]
		on: Error
		do: [ :ex | ^ self ].	"Unicode characters not supported"
	maxValue := SmaCCGrammar maximumCharacterValue.
	[ (parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%unicode;
			<anything> : .;
			begin : <anything> + {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: '->→') ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]