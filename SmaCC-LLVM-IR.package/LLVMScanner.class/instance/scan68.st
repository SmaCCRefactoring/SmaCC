generated
scan68
	self step.
	currentCharacter = $_
		ifTrue: [ ^ self scan69 ].
	^ self reportLastMatch