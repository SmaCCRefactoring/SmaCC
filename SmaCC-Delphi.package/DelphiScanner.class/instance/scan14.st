generated
scan14
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ self recordMatch: #(143).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan14 ] ].
	^ self reportLastMatch