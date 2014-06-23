generated
scan10
	2
		timesRepeat: [ 
			self step.
			currentCharacter = $"
				ifFalse: [ 
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $!)
										or: [ (currentCharacter between: $# and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan8 ].
					^ self reportLastMatch ] ].
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan11 ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan14 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self scan8