actions
setParserClass
	| name |
	name := UIManager default request: 'Enter parser class name:' initialAnswer: self parserClassName.
	(name isNil or: [ name isEmpty ])
		ifTrue: [ ^ self ].
	(self isValidName: name)
		ifFalse: [ ^ UIManager default inform: 'Invalid Class Name' ].
	self parserClassName: name asSymbol