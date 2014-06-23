generated
scan32
	self step.
	currentCharacter = $a
		ifTrue: [ ^ self scan33 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $`)
						or: [ (currentCharacter between: $b and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch