tests
testReduceActionReuse
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition:
			'<a> : a ;
			begin : <a> {#()};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass selectors anySatisfy: [ :each | each beginsWith: 'reduceActionFor' ])