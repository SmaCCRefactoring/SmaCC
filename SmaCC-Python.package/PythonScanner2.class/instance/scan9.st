generated
scan9
	[ 
	self step.
	currentCharacter = $'
		ifTrue: [ 
			2
				timesRepeat: [ 
					self step.
					currentCharacter = $'
						ifFalse: [ 
							currentCharacter = $\
								ifTrue: [ ^ self scan10 ].
							^ self scan9 ] ].
			[ 
			self recordMatch: #(78).
			self step.
			currentCharacter = $' ] whileTrue.
			currentCharacter = $\
				ifTrue: [ ^ self scan10 ].
			^ self scan9 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan10 ] ] repeat