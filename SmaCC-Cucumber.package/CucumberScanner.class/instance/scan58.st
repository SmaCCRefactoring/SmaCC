generated
scan58
	self step.
	currentCharacter = $e
		ifTrue: [ ^ self scan59 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $d)
						or: [ (currentCharacter between: $f and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch