generated
scan35
	self recordMatch: #(16).
	self step.
	currentCharacter = $!
		ifTrue: [ ^ self scan36 ].
	^ self reportLastMatch