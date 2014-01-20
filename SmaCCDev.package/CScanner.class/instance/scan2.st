generated-scanner
scan2
	self step.
	(currentCharacter between: $0 and: $9)
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch