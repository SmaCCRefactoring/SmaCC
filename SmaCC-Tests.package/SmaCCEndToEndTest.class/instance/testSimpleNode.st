tests-parse tree creation
testSimpleNode
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%root FooNode ;
			test : "a" ''letter'' {{FooNode}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a'.
	self assert: node class name asString = 'FooNode'.
	self assert: node letter value = 'a'.
	self assert: node letter startPosition = 1.
	self assert: node letter stopPosition = 1.
	self assert: node class superclass = SmaCCParseNode.
	self assert: node copy ~~ node.
	self assert: node copy letter ~~ node letter.
	self assert: node = node copy.
	self assert: node hash = node copy hash.
	(self lookupType: #FooNodeVisitor) new acceptNode: node