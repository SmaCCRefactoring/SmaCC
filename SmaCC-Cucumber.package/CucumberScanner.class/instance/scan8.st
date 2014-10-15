generated
scan8
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self scan9 ].
					currentCharacter = Character cr
						ifTrue: [ ^ self scan12 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
					^ self scan7 ] ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch