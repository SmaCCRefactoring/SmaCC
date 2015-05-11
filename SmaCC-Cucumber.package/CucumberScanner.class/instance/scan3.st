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
						ifTrue: [ ^ self scan5 ] ].
			(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
				ifTrue: [ ^ self scan4 ].
			^ self scan3 ].
	(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
		ifTrue: [ ^ self scan4 ] ] repeat