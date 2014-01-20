public
testComments
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<a> : /* q */ /***/ /****/ a # b 
				;
			/* */ /***/ /****/
			#this is a comment
			begin : <a> {true};'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self assert: (self parserClass parse: 'a')