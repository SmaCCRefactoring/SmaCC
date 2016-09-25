generated
scan8X10
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $J ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $J ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch