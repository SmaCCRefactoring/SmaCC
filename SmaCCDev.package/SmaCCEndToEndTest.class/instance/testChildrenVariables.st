tests
testChildrenVariables
	| parserCompiler node |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			%hierarchy If (IfElse);
			%left "+" "-" ;
			If : "if" number ''a'' "then" number ''b'' {{If}}
				| "if" number ''a'' "then" number ''b'' "else" number ''c'' {{IfElse}};
			number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	node := self parserClass parse: 'if 1 then 2 else 3'.
	self assert: node class name asString = 'FooIfElseNode'.
	self assert: node children size = 3