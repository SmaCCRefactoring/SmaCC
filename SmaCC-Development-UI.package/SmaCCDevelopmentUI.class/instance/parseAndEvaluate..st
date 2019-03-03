actions
parseAndEvaluate: aBlock
	| class |
	self testTextModel acceptEdits.
	class := self parserClass.
	class isNil
		ifTrue: [ UIManager default inform: 'No parser defined'.
			^ false ]
		ifFalse: [ Cursor wait
				showWhile: [ aBlock
						value:
							(class
								parse: self testTextModel text asString
								onError: [ :aString :position | 
									self displayError: aString at: position in: self testTextModel.
									^ false ]) ] ].
	^ true