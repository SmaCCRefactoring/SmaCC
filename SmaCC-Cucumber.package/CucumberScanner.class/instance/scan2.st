generated
scan2
	[ 
	self recordMatch: #(6).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $#
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(8 9) ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ currentCharacter = $! or: [ (currentCharacter between: $$ and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch