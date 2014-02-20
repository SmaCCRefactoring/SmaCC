generated
scan21
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self scan20 ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ ^ self scan20 ].
			^ self reportLastMatch ].
	^ self scan20