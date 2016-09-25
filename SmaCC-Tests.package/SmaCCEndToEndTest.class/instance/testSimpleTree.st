tests-parse tree creation
testSimpleTree
	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			%left "+" "-" ;
			Expression : Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
				| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
				| <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '2 + 3 - 4'.
	self assert: node class name asString = 'FooBinaryNode'.
	self assert: node operator value = '-'.
	self assert: node class superclass name asString = 'FooParseNode'.
	self assert: node right class name asString = 'FooNumberNode'.
	self assert: node right parent == node.
	self assert: node left parent == node.
	self assert: node parent isNil.
	self assert: node children size = 2.
	self assert: (node children includes: node left).
	self assert: (node children includes: node right).
	self assert: node right number value = '4'.
	self assert: node left operator value = '+'.
	self assert: node left left number value = '2'.
	self assert: node left right number value = '3'.
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy left ~~ node left.
	self assert: copy right ~~ node right.
	self assert: copy operator ~~ node operator.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node