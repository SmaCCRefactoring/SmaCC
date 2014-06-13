generated
scan30
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self scan29 ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ ^ self scan29 ].
			^ self reportLastMatch ].
	^ self scan29