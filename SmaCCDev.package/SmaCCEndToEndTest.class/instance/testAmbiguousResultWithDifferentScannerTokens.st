public
testAmbiguousResultWithDifferentScannerTokens
	| parserCompiler results result |
	parserCompiler := SmaCCGrammarCompiler new.
	parserCompiler
		buildDefinition: '%id <a> <aa>;
			<a> : a ; <aa> : aa;
			%glr;
			List : Item {''1''} | List Item {''1'' + ''2''} ;
			Item : <a> {1} | <aa> {1.5};
			'.
	parserCompiler compileInto: 'TestScanner'
		andParser: 'TestParser'.
	self parserClass compile: 'alwaysPerformReduceAction ^true'.
	self parserClass
		compile: 'actionsForCurrentToken 
		| oldToken oldPosition |
		(currentToken ids includes: scanner aaId) ifTrue: [
			oldToken := currentToken.
			oldPosition := scanner position.
			self position: currentToken stopPosition - 1.
			currentToken := currentToken class value: ''a'' start: currentToken startPosition ids: (Array with: scanner aId).
			super actionsForCurrentToken do: [:each | self splitWithAction: each].
			currentToken := oldToken.
			self position: oldPosition.
		].
		^super actionsForCurrentToken'.
	self assert: (self parserClass parse: 'a') = 1.
	[result := self parserClass parse: 'aa'] on: SmaCCAmbiguousResultNotification
		do: 
			[:ex |
			results := ex tag
						collect: [:each | each performOnSmaCCParser: ex parser].
			ex resume: 0].
	self assert: result = 0.
	self assert: results size = 2.
	self assert: (results includes: 2).
	self assert: (results includes: 1.5)