generated
scan3
	[ 
	self recordMatch: #(12).
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $"
				ifTrue: [ 
					self recordMatch: #(12).
					self step.
					currentCharacter = $"
						ifTrue: [ 
							self recordMatch: #(1 12).
							self step.
							(currentCharacter <= Character tab
								or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
								ifTrue: [ 
									[ 
									self recordMatch: #(12).
									self step.
									currentCharacter <= Character tab
										or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
										whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
				ifTrue: [ ^ self scan4 ].
			^ self scan3 ].
	(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
		ifTrue: [ ^ self scan4 ] ] repeat