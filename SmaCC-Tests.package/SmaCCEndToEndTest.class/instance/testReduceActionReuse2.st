tests
testReduceActionReuse2
	"This test in fact check that this method is reused."

	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : a ;
			begin : <a> {nil};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			(self parserClass selectors
				noneSatisfy: [ :each | each beginsWith: 'reduceActionFor' ])