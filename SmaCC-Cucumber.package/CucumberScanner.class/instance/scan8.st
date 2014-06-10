generated
scan8
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan9 ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan10 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan12 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			^ self scan1 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #(6).
			self step.
			currentCharacter = $#
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: $") or: [ (currentCharacter between: $$ and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	^ self scan1