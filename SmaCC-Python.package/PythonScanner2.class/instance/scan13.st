generated
scan13
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
								ifTrue: [ ^ self scan14 ].
							^ self scan13 ] ].
			[ 
			self recordMatch: #(78).
			self step.
			currentCharacter = $' ] whileTrue.
			currentCharacter = $\
				ifTrue: [ ^ self scan14 ].
			^ self scan13 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan14 ] ] repeat