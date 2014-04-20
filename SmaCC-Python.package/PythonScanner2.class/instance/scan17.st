generated
scan17
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
								ifTrue: [ ^ self scan18 ].
							^ self scan17 ] ].
			[ 
			self recordMatch: #(72).
			self step.
			currentCharacter = $' ] whileTrue.
			currentCharacter = $\
				ifTrue: [ ^ self scan18 ].
			^ self scan17 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan18 ] ] repeat