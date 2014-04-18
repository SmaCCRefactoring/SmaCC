generated
scan6
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
								ifTrue: [ ^ self scan7 ].
							^ self scan6 ] ].
			[ 
			self recordMatch: #(78).
			self step.
			currentCharacter = $" ] whileTrue.
			currentCharacter = $\
				ifTrue: [ ^ self scan7 ].
			^ self scan6 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan7 ] ] repeat