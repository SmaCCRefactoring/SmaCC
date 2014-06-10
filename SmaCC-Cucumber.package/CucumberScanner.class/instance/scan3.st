generated
scan3
	2
		timesRepeat: [ 
			self step.
			currentCharacter = $"
				ifFalse: [ 
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(9) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $!)
										or: [ (currentCharacter between: $# and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan1 ].
					^ self reportLastMatch ] ].
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan4 ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self scan1