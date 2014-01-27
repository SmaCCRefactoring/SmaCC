actions
parseAndEvaluate: aBlock 
	| class |
	self testCodeHolder acceptContents: self testText.
	self testCodeHolder changed: #contents.
	class := self parserClass.
	class isNil
		ifTrue: [UIManager default inform: 'No parser defined'.
			^ false]
		ifFalse: [Cursor wait showWhile: [aBlock
				value: (class
						parse: self testText
						onError: [:aString :position | 
							self
								displayError: aString
								at: position
								notifying: self testCodeHolder contentsMorph.
							self testCodeHolder hasUnacceptedEdits: true.
							^ false])]].
	^ true