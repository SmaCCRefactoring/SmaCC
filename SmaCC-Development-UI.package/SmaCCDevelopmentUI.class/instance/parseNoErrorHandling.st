actions
parseNoErrorHandling
	| class |
	self testCodeHolder contents: self testText.
	self testCodeHolder changed: #contents.
	class := self parserClass.
	class isNil
		ifTrue: [ UIManager default inform: 'No parser defined'.
			^ false ]
		ifFalse:
			[ Cursor wait showWhile: [ class parse: self testText asString ] ].
	^ true