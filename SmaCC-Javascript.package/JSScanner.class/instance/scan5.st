generated
scan5
	self step.
	currentCharacter = $u
		ifTrue: [ 
			4
				timesRepeat: [ 
					self step.
					currentCharacter isHexDigit
						ifFalse: [ ^ self reportLastMatch ] ].
			^ self scan4 ].
	^ self reportLastMatch