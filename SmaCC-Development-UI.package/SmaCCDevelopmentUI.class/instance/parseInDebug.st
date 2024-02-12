actions
parseInDebug

	| class |
	self testCodeHolder contents: self testText.
	self testCodeHolder changed: #contents.
	class := self parserClass.
	class
		ifNil: [ 
			UIManager default inform: 'No parser defined'.
			^ false ]
		ifNotNil: [ class parseInDebug: self testText asString ].
	^ true