testing
testExpressions
	#(#LR1 #LALR1) do: 
			[:each | 
			| parserCompiler |
			parserCompiler := SmaCCGrammarCompiler new.
			parserCompiler grammar type: each.
			parserCompiler buildScanner: self expressionScannerString
				andParser: self expressionParserString.
			parserCompiler compileInto: TestScanner andParser: TestParser.
			self assert: (TestParser parse: '2 + 3 * 4 / 5 ^ 3 ^ 2') 
						= (2 + (3 * 4 / (5 raisedTo: (3 raisedTo: 2)))).
			self assert: (TestParser parse: '1.0*2/3+4.0^2^3+3') 
						= (1.0 * 2 / 3 + (4.0 raisedTo: (2 raisedTo: 3)) + 3).
			self assert: (TestParser parse: '(((1 + 2) * 3) ^ 2) ^ 3') 
						= (((1 + 2) * 3 raisedTo: 2) raisedTo: 3)]