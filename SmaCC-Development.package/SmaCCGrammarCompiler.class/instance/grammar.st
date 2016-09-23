accessing
grammar
	^ grammar isNil
		ifTrue: [ grammar := SmaCCGrammar new ]
		ifFalse: [ grammar ]