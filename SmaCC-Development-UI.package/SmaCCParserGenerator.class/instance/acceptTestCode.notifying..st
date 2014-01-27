actions
acceptTestCode: aStringOrAText notifying: aRequestor 
	| class |
	class := self parserClass.
	class isNil
		ifTrue: [UIManager default inform: 'No parser defined'.
			^ false].
	^ self parse