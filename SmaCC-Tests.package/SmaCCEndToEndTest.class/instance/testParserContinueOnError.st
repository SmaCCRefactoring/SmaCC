tests-extensions
testParserContinueOnError
	"Write a test showing how a parser may reset partially itself after an error to continue parsing -- streaming mode."

	| compiler node parser results |
	compiler := SmaCCGrammarCompiler new category: self class category.
	results := OrderedCollection new.
	compiler
		buildDefinition:
			'<name> : \w+; <whitespace> : \s+; 
			B : "(" A ")"  ;
			A : <name> { Notification signal: ''1'' value } ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	parser := self parserClass on: (ReadStream on: '( foo ) ( bar )').
	[ [ parser parse ]
		on: Notification
		do: [ :n | 
			results add: n messageText.
			n resume ] ]
		on: SmaCCParserError
		do: [ :ex | parser partialReset ].
	[ parser parse ]
		on: Notification
		do: [ :n | 
			results add: n messageText.
			n resume ].
	self assert: results size = 2.
	self assert: results first = 'foo'.
	self assert: results second = 'bar'.
	self assert: parser scanner atEnd