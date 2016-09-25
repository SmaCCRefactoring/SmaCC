generated
scan7
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan7X9 ].
	currentCharacter == $1
		ifTrue:
			[ ^ self scan7X8 ].
	currentCharacter == $2
		ifTrue:
			[ ^ self scan7X7 ].
	currentCharacter == $3
		ifTrue:
			[ ^ self scan7X6 ].
	^ self scan7X11