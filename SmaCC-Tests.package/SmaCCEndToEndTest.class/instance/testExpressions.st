tests
testExpressions
	#(#LR1 #LALR1)
		do:
			[ :each | 
			| parserCompiler |
			(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
				defaultCategory: self class category.
			parserCompiler grammar type: each.
			parserCompiler
				buildDefinition: self expressionScannerString , self expressionParserString.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
			self
				assert:
					(self parserClass parse: '2 + 3 * 4 / 5 ^ 3 ^ 2')
						= (2 + (3 * 4 / (5 raisedTo: (3 raisedTo: 2)))).
			self
				assert:
					(self parserClass parse: '1.0*2/3+4.0^2^3+3')
						= (1.0 * 2 / 3 + (4.0 raisedTo: (2 raisedTo: 3)) + 3).
			self
				assert:
					(self parserClass parse: '(((1 + 2) * 3) ^ 2) ^ 3')
						= (((1 + 2) * 3 raisedTo: 2) raisedTo: 3) ]