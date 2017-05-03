generated
scanForTokenX5
	self recordMatch: #(131).
	self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan13 ].
	^ self reportLastMatch