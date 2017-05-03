generated
scan7
	self step.
	currentCharacter == $$
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self step.
					currentCharacter == $#
						ifTrue: [ ^ self scan7 ].
					currentCharacter == $'
						ifTrue: [ ^ self scan2 ].
					currentCharacter == $^
						ifTrue: [ ^ self scan6 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan6 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch