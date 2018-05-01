tests-parse tree creation
testPullUpMultipleTypesWithStar3
	"Issue: ensure that two generated non-terminals do not collide."

	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B | C ;
			B : "b"  (<number> ''b'') * {{FooBNode}};
			C : "c"  (<number> ''c'') * {{FooCNode}} ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: ('FooBNode' asClass allInstVarNames includes: 'bs').
	self assert: ('FooCNode' asClass allInstVarNames includes: 'cs').
	node := self parserClass parse: 'b 1 2 3 4'.
	self assert: node class name asString = 'FooBNode'.
	node bs
		keysAndValuesDo: [ :key :each | 
			self assert: key printString = each value ]