generated
scan58
	self step.
	currentCharacter = $c
		ifTrue: [ ^ self scan59 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $b)
						or: [ (currentCharacter between: $d and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch