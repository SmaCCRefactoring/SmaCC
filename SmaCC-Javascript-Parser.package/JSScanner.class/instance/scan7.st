generated
scan7
	self recordMatch: #(86).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch