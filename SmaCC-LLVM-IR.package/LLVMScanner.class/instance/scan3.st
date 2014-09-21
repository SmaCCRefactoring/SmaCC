generated
scan3
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan4 ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(264).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan4 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ ^ self scan3 ] ].
	^ self reportLastMatch