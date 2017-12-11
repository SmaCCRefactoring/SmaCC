generated
scan2
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan4 ].
	(currentCharacter <= $!
		or: [ (currentCharacter between: $# and: $[)
				or: [ currentCharacter >= $] ] ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch