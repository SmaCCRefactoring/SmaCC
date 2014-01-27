testing
testIgnoreCaseKeywords
	| parserCompiler case |
	case := SmaCCGrammar ignoreCase.
	SmaCCGrammar ignoreCase: true.
	
	[parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler 
		buildScanner: '<identifier> : [a-z_]+ ; <whitespace> : \s+ ;'
		andParser: 'Start ::= "Foo" {true} | <identifier> <identifier> {false};'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: 'FOo').
	self deny: (TestParser parse: 'FoObAr ASDS')] 
			ensure: [SmaCCGrammar ignoreCase: case]