accessing
position
	^currentToken isNil ifTrue: [scanner position] ifFalse: [currentToken startPosition]