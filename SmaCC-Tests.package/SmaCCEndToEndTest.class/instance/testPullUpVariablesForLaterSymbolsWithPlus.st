tests-parse tree creation
testPullUpVariablesForLaterSymbolsWithPlus
	"Test if the plus variant properly name the ast class."

	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : "a" ''a'' <number> ''number'' + {{FooNode}} ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a 1 2 3 4'.
	node numbers
		keysAndValuesDo: [ :key :each | self assert: key printString = each value ].
	self assert: node numbers size = 4