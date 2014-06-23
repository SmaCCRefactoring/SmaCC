generated
scan9
	self recordMatch: #(3 6 7 16).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $#
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9 10) ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #(7).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan10 ].
			currentCharacter = $#
				ifTrue: [ ^ self scan15 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9 10) ].
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ currentCharacter = $! or: [ (currentCharacter between: $$ and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch