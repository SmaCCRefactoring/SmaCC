generated
scan4
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			2
				timesRepeat: [ 
					self step.
					currentCharacter = $"
						ifFalse: [ 
							currentCharacter = $\
								ifTrue: [ ^ self scan5 ].
							^ self scan4 ] ].
			[ 
			self recordMatch: #(78).
			self step.
			currentCharacter = $" ] whileTrue.
			currentCharacter = $\
				ifTrue: [ ^ self scan5 ].
			^ self scan4 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan5 ] ] repeat