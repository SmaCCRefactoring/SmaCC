generated
scan2
	self recordMatch: #(23).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch