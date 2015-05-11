generated
scan7
	[ 
	self recordMatch: #(12).
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $`
				ifTrue: [ 
					self recordMatch: #(12).
					self step.
					currentCharacter = $`
						ifTrue: [ ^ self scan5 ] ].
			(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
				ifTrue: [ ^ self scan8 ].
			^ self scan7 ].
	(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
		ifTrue: [ ^ self scan8 ] ] repeat