actions
parseNoErrorHandling

	| class |
	self testCodeHolder contents: self testText.
	self testCodeHolder changed: #contents.
	class := self parserClass.
	class
		ifNil: [
			UIManager default inform: 'No parser defined'.
			^ false ]
		ifNotNil: [
		Cursor wait showWhile: [ class parse: self testText asString ] ].
	^ true