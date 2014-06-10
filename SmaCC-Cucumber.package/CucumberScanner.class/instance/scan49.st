generated
scan49
	self step.
	currentCharacter = Character cr
		ifTrue: [ self step ].
	currentCharacter = Character lf
		ifTrue: [ ^ self scan50 ].
	^ self reportLastMatch