tests
testTokenCollection
	| compiler node |
	compiler := SmaCCGrammarCompiler new.
	compiler
		buildDefinition:
			'<whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; 
			%root P; %glr; %prefix Foo; %suffix Node;
			A : C B ''b'' C {{}};
			B : C {{}};
			C : "," ''comma''; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ',,,'.
	self assert: node b comma startPosition = 2.
	self assert: node commas first startPosition = 1.
	self assert: node commas last startPosition = 3.
	self assert: node commas size = 2