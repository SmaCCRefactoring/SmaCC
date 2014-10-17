generated
scan15
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self scan14 ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ ^ self scan14 ].
			^ self reportLastMatch ].
	^ self scan14