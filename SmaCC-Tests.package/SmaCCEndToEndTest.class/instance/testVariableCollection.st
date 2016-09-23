public
testVariableCollection
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; 
			%root P; %glr; %prefix Foo; %suffix Node;
			A : B {{}};
			B : C | "d" ''d'';
			C : "," ''comma''; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ','.
	self assert: node comma startPosition = 1.
	self assert: node d isNil.
	node := self parserClass parse: 'd'.
	self assert: node comma isNil.
	self assert: node d startPosition = 1