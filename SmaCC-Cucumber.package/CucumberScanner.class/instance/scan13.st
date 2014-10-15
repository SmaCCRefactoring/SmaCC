generated
scan13
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan14 ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan15 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan17 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			^ self scan7 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #(7).
			self step.
			currentCharacter = $#
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: $") or: [ (currentCharacter between: $$ and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	^ self scan7