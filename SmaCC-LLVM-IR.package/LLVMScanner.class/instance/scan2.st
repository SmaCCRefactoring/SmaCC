generated
scan2
	self recordMatch: #(264 266).
	self step.
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch