generated
scan4
	self recordMatch: #(264).
	self step.
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch