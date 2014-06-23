generated
scan30
	self step.
	currentCharacter = $e
		ifTrue: [ ^ self scan31 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $d)
						or: [ (currentCharacter between: $f and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch