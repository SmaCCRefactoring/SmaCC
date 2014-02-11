generated
scan20
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self scan19 ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ ^ self scan19 ].
			^ self reportLastMatch ].
	^ self scan19