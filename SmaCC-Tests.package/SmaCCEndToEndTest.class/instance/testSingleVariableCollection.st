public
testSingleVariableCollection
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; <integer> : \d+;
			%root P; %glr; %prefix Foo; %suffix Node;
			A : B {{}};
			B : B C ''item'' | ; 
			C : "#(" D ")" {{}};
			D :  | D <integer> ''item''; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '#(1)#(2 3 4)'.
	self assert: node items size = 2.
	self assert: node items first items size = 1.
	self assert: node items last items size = 3