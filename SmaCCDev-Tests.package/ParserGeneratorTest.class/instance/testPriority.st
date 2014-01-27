testing
testPriority
	| parserCompiler |
	TestScanner 
		compile: 'all ^self recordAndReportMatch: (Array with: self allId)'.
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler buildScanner: '<a> : \{ | \< \% ;
						<all> : .;'
		andParser: '%id <all> <a>;  begin : A {true}
							| All {false};
					A : <a> ;
					All: <all>;'.
	parserCompiler compileInto: TestScanner andParser: TestParser.
	self assert: (TestParser parse: '{').
	self assert: (TestParser parse: '<%').
	self deny: (TestParser parse: '}')