generated
scanSplit6
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
				ifTrue: [ ^ self scan18 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan19 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			^ self scan7 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $#
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $@
		ifTrue: [ 
			self step.
			currentCharacter = $|
				ifTrue: [ ^ self scan20 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space or: [ currentCharacter = $@ ] ])
				ifTrue: [ ^ self scan7 ].
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
						ifTrue: [ ^ self scan20 ].
					(currentCharacter = Character tab or: [ currentCharacter = Character space or: [ currentCharacter = $@ ] ])
						ifTrue: [ ^ self scan7 ].
					currentCharacter <= Character backspace
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: Character arrowDown)
										or: [ (currentCharacter between: $! and: $?) or: [ (currentCharacter between: $A and: ${) or: [ currentCharacter >= $} ] ] ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $A
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ ^ self scan21 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $c)
										or: [ (currentCharacter between: $e and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan7 ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $m)
								or: [ (currentCharacter between: $o and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $B
		ifTrue: [ ^ self scanSplit2 ].
	currentCharacter = $E
		ifTrue: [ ^ self scanSplit3 ].
	currentCharacter = $F
		ifTrue: [ ^ self scanSplit4 ].
	currentCharacter = $G
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $v
						ifTrue: [ ^ self scan22 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $u)
										or: [ (currentCharacter between: $w and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan7 ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $h)
								or: [ (currentCharacter between: $j and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $S
		ifTrue: [ ^ self scanSplit5 ].
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
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter isSeparator
		ifTrue: [ 
			self recordMatch: #(3 6 7 16).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $#
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9 10) ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self recordMatch: #(7).
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self scan8 ].
					currentCharacter = $#
						ifTrue: [ ^ self scan13 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(9 10) ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ currentCharacter = $! or: [ (currentCharacter between: $$ and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	('TW' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter = $h
				ifTrue: [ ^ self scan22 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $g)
								or: [ (currentCharacter between: $i and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	^ self scan7