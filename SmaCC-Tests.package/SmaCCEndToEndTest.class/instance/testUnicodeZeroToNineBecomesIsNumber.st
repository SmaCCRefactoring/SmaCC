tests-unicode
testUnicodeZeroToNineBecomesIsNumber
	"This test shows that SmaCC will expand a [0-9] category into a <isDigit> test, and that this test will also include all unicode digit characters."

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
<number> : [0-9];
begin : <hash> <number> + {true} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			(self parserClass
				parse: (String with: $# with: (Character value: 16r662))) ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]