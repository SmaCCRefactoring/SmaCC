generated
scanForToken
	self recordMatch: #(3 6 16 17).
	self step.
	currentCharacter = Character tab
		ifTrue: [ 
			self recordMatch: #(2 5 6).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $#
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(8 9) ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ ^ self scan2 ].
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ currentCharacter = $! or: [ (currentCharacter between: $$ and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(4 5) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(4 5) ].
			^ self reportLastMatch ].
	currentCharacter = Character space
		ifTrue: [ 
			self recordMatch: #(2 5 6 15).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $#
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(8 9) ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ ^ self scan2 ].
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ currentCharacter = $! or: [ (currentCharacter between: $$ and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $#
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan51 ].
	currentCharacter = $A
		ifTrue: [ ^ self scan53 ].
	currentCharacter = $B
		ifTrue: [ ^ self scan55 ].
	currentCharacter = $E
		ifTrue: [ ^ self scan56 ].
	currentCharacter = $G
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $v
						ifTrue: [ ^ self scan57 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(9) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $u)
										or: [ (currentCharacter between: $w and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan1 ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $h)
								or: [ (currentCharacter between: $j and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $S
		ifTrue: [ 
			self step.
			currentCharacter = $c
				ifTrue: [ ^ self scan58 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $b)
								or: [ (currentCharacter between: $d and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	('TW' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter = $h
				ifTrue: [ ^ self scan57 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $g)
								or: [ (currentCharacter between: $i and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	^ self scan1