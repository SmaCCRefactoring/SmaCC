generated
scan16
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
								ifTrue: [ ^ self scan17 ].
							^ self scan16 ] ].
			[ 
			self recordMatch: #(72).
			self step.
			currentCharacter = $' ] whileTrue.
			currentCharacter = $\
				ifTrue: [ ^ self scan17 ].
			^ self scan16 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan17 ] ] repeat