generated
scan7
	self recordMatch: #(4 7).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(5 6 16) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(16).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(5 6) ].
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan20 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan21 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			^ self scan8 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $#
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $@
		ifTrue: [ 
			self step.
			currentCharacter = $|
				ifTrue: [ ^ self scan22 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space or: [ currentCharacter = $@ ] ])
				ifTrue: [ ^ self scan8 ].
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: $?) or: [ (currentCharacter between: $A and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(2).
					self step.
					currentCharacter = $|
						ifTrue: [ ^ self scan22 ].
					(currentCharacter = Character tab or: [ currentCharacter = Character space or: [ currentCharacter = $@ ] ])
						ifTrue: [ ^ self scan8 ].
					currentCharacter <= Character backspace
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: Character arrowDown)
										or: [ (currentCharacter between: $! and: $?) or: [ (currentCharacter between: $A and: ${) or: [ currentCharacter >= $} ] ] ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $A
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $B
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $E
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $F
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $G
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $v
						ifTrue: [ ^ self scan28 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $u)
										or: [ (currentCharacter between: $w and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan8 ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $h)
								or: [ (currentCharacter between: $j and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	currentCharacter = $S
		ifTrue: [ ^ self scan29 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter between: Character pageUp and: Character newPage)
		ifTrue: [ 
			self recordMatch: #(16).
			self step.
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ (currentCharacter between: (Character value: 14) and: ${) or: [ currentCharacter >= $} ] ] ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	currentCharacter isSeparator
		ifTrue: [ ^ self scan9 ].
	('TW' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter = $h
				ifTrue: [ ^ self scan28 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $g)
								or: [ (currentCharacter between: $i and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	^ self scan8