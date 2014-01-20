testing
testRecursiveRule
	#(#LR1 #LALR1) do: 
			[:each | 
			| parserCompiler |
			parserCompiler := SmaCCGrammarCompiler new.
			parserCompiler grammar type: each.
			parserCompiler buildScanner: self expressionScannerString
				andParser: 'Test: Test1 Recursive;
							Test1: <number> {''1'' value};
							Recursive: | Recursive "|" <number> {''1'' add: ''3'' value; yourself};'.
			parserCompiler compileInto: TestScanner andParser: TestParser.
			self 
				assert: ((parserCompiler grammar nonTerminalSymbolNamed: 'Recursive') 
						firstTerminals 
							includes: (parserCompiler grammar keywordTerminalNamed: '"|"')).
			self 
				assert: (TestParser parse: '2|3|4') = (OrderedCollection 
								with: '2'
								with: '3'
								with: '4')]