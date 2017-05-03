generated
scan4
	self step.
	currentCharacter == $$
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(139).
					self step.
					currentCharacter == $#
						ifTrue: [ ^ self scan4 ].
					currentCharacter == $'
						ifTrue: [ ^ self scan2 ].
					currentCharacter == $^
						ifTrue: [ ^ self scan5 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(139).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan4 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan5 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch