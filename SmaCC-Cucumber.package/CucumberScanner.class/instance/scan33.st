generated
scan33
	self step.
	currentCharacter = $r
		ifTrue: [ ^ self scan34 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $q)
						or: [ (currentCharacter between: $s and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch