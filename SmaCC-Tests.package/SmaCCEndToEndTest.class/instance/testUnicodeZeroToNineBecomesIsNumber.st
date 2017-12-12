tests-unicode
testUnicodeZeroToNineBecomesIsNumber
	"This test shows that SmaCC may expand a [0-9] category into a <isDigit> test, and that this test will also include all unicode digit characters. Here we make sure that only a direct use of isDigit , even on a parser limited to 0-255, would generate an isDigit."

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
<any> : . ;
begin : <hash> <number> + {true} | <hash> <any> + {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		deny:
			(self parserClass
				parse: (String with: $# with: (Character value: 16r662))) ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]