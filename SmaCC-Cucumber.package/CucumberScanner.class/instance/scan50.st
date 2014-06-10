generated
scan50
	self recordMatch: #(3).
	self step.
	currentCharacter = $!
		ifTrue: [ ^ self scan49 ].
	^ self reportLastMatch