generated
scan23
	self step.
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $d
				ifTrue: [ ^ self scan24 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $c)
								or: [ (currentCharacter between: $e and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $m)
						or: [ (currentCharacter between: $o and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch