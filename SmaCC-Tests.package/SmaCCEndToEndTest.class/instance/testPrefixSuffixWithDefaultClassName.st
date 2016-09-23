tests-parse tree creation
testPrefixSuffixWithDefaultClassName
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%root Test ; %prefix Foo; %suffix Node; 
			test : "a" ''letter'' {{}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a'.
	self assert: node class name asString = 'FooTestNode'.
	self assert: node class superclass = SmaCCParseNode.
	(self lookupType: #FooTestNodeVisitor) new acceptNode: node