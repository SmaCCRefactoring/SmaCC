generated
scanForToken
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	^ self scanForTokenX7