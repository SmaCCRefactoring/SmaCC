tests-parse tree creation
testOptionalComponentWithQuestionMark2
	"Test the variant with a question mark and labeling and single production."

	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : "b" ''b'' ? {{FooANode}} ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ''.
	self assert: node b isNil.
	node := self parserClass parse: 'b'.
	self assert: node b startPosition = 1