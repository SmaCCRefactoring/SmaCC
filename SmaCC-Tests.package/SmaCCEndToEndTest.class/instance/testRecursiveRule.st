tests
testRecursiveRule
	#(#LR1 #LALR1)
		do:
			[ :each | 
			| parserCompiler |
			(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
				defaultCategory: self class category.
			parserCompiler grammar type: each.
			parserCompiler
				buildDefinition:
					self expressionScannerString
						,
							'Test: Test1 Recursive;
							Test1: <number> {''1'' value};
							Recursive: | Recursive "|" <number> {''1'' add: ''3'' value; yourself};'.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
			self
				assert:
					((parserCompiler grammar nonTerminalSymbolNamed: 'Recursive')
						firstTerminals
						includes: (parserCompiler grammar keywordTerminalNamed: '"|"')).
			self
				assert:
					(self parserClass parse: '2|3|4') asOrderedCollection
						= (OrderedCollection with: '2' with: '3' with: '4') ]