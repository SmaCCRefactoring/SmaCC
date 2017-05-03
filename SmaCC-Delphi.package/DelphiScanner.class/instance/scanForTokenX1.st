generated
scanForTokenX1
	self recordMatch: #(134).
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan14 ] ].
	^ self reportLastMatch