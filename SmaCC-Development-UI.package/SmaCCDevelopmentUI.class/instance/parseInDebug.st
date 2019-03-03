actions
parseInDebug
	| class |
	self testTextModel acceptEdits.
	class := self parserClass.
	class isNil
		ifTrue: [ UIManager default inform: 'No parser defined'.
			^ false ]
		ifFalse: [ class parseInDebug: self testTextModel text asString ].
	^ true