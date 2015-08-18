generated
scan14
	self step.
	currentCharacter = $u
		ifTrue: [ 
			4
				timesRepeat: [ 
					self step.
					currentCharacter isHexDigit
						ifFalse: [ ^ self reportLastMatch ] ].
			^ self scan13 ].
	^ self reportLastMatch