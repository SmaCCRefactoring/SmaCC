generated
scan31
	self step.
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(17).
			self step.
			currentCharacter = $!
				ifTrue: [ ^ self scan14 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character space)
								or: [ (currentCharacter between: $" and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $9)
						or: [ (currentCharacter between: $; and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch