actions
acceptTestCode: aStringOrAText notifying: aRequestor

	| class |
	class := self parserClass.
	class ifNil: [
		UIManager default inform: 'No parser defined'.
		^ false ].
	^ self parse