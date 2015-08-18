generated
scan7
	self recordMatch: #(83).
	self step.
	currentCharacter = $'
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch