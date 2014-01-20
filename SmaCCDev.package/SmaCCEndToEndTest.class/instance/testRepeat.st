public
testRepeat
	| parserCompiler |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<letters> : [a-zA-Z];
			<test> : (\`[^\`]*\`)+;
			All : | All Test ;
			Test : <letters> | <test> ;'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self assert: (self parserClass parse: '`a`b`c`') size = 3