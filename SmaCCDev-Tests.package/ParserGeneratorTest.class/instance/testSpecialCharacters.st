testing
testSpecialCharacters
	| parserCompiler |
	[String with: (Character value: 16rFF00)] on: Error do: [:ex | ^self].	"Unicode characters not supported"
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<name> : \x3g \x20 \xFF \xFF1 \xFF00 \cC;'
		andParser: 'begin ::= <name> {true};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser 
				parse: (String withAll: (#(3 103 16r20 16rFF 16rFF1 16rFF00 2) 
								collect: [:each | Character value: each])))