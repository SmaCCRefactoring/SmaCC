public
testAmbiguousResults
	| parserCompiler results result |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '<int> : \d+; <whitespace>: \s+;
			%glr;
			Expression : Expression "+" Expression {''1'' + ''3''}
				| Expression "*" Expression {''1'' * ''3''}
				| <int> {''1'' value asNumber};
			'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self parserClass compile: 'alwaysPerformReduceAction ^true'.
	self assert: (self parserClass parse: '3 + 4') = 7.
	self assert: (self parserClass parse: '3 * 4') = 12.
	[result := self parserClass parse: '2 + 3 * 4']
		on: SmaCCAmbiguousResultNotification
		do: 
			[:ex |
			results := ex tag
						collect: [:each | each performOnSmaCCParser: ex parser].
			ex resume: 0].
	self assert: result = 0.
	self assert: results size = 2.
	self assert: (results includes: 20).
	self assert: (results includes: 14).

	"There are a bunch of ways to parse the following expression. If we don't merge the possibilities, then this will never complete."
	self
		assert: (self parserClass
				parse: '1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1')
					= 60