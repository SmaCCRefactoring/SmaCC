generated
scan12X11
	self recordMatch: #(35 41).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch