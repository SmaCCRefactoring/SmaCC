generated
scan36
	self step.
	currentCharacter = Character cr
		ifTrue: [ self step ].
	currentCharacter = Character lf
		ifTrue: [ ^ self scan37 ].
	^ self reportLastMatch