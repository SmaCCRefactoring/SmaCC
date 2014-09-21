generated
scan5
	self recordMatch: #(264 266).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan4 ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch