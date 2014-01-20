generated-scanner
scan7
	self step.
	(currentCharacter <= $! or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ])
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch