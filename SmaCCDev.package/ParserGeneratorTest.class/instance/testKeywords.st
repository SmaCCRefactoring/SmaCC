testing
testKeywords
	| parserCompiler size case |
	size := SmaCCGrammar maximumCharacterValue.
	case := SmaCCGrammar ignoreCase.
	SmaCCGrammar ignoreCase: true.
	self supportsUnicodeStrings 
		ifTrue: [SmaCCGrammar maximumCharacterValue: (2 raisedTo: 16) - 1].
	
	[parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '' andParser: 'Start ::= "Foo" "bar";'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	TestParser parse: 'FoObAr'] 
			ensure: 
				[SmaCCGrammar
					ignoreCase: case;
					maximumCharacterValue: size]