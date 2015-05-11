generated
scanSplit1
	self step.
	currentCharacter = $#
		ifTrue: [ 
			self recordMatch: #(10 11).
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(10).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $@
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(9).
					self step.
					currentCharacter <= Character backspace
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: Character arrowDown)
										or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $A
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $n
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $B
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $a
				ifTrue: [ ^ self scan9 ].
			currentCharacter = $u
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	currentCharacter = $E
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $x
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	currentCharacter = $F
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self scan14 ].
			^ self reportLastMatch ].
	currentCharacter = $G
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $i
				ifTrue: [ ^ self scan16 ].
			^ self reportLastMatch ].
	currentCharacter = $S
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $c
				ifTrue: [ ^ self scan19 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(8 11) ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $#
				ifTrue: [ 
					[ 
					self recordMatch: #(10).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $@
				ifTrue: [ ^ self scan5 ].
			currentCharacter = $A
				ifTrue: [ ^ self scan6 ].
			currentCharacter = $B
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $E
				ifTrue: [ ^ self scan11 ].
			currentCharacter = $F
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $G
				ifTrue: [ ^ self scan15 ].
			currentCharacter = $S
				ifTrue: [ ^ self scan18 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $#
						ifTrue: [ 
							[ 
							self recordMatch: #(10).
							self step.
							currentCharacter <= Character tab
								or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
								whileTrue.
							^ self reportLastMatch ].
					currentCharacter = $@
						ifTrue: [ ^ self scan5 ].
					currentCharacter = $A
						ifTrue: [ ^ self scan6 ].
					currentCharacter = $B
						ifTrue: [ ^ self scan8 ].
					currentCharacter = $E
						ifTrue: [ ^ self scan11 ].
					currentCharacter = $F
						ifTrue: [ ^ self scan13 ].
					currentCharacter = $G
						ifTrue: [ ^ self scan15 ].
					currentCharacter = $S
						ifTrue: [ ^ self scan18 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(8) ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
			('TW' includes: currentCharacter)
				ifTrue: [ ^ self scan20 ].
			^ self reportLastMatch ].
	('TW' includes: currentCharacter)
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $h
				ifTrue: [ ^ self scan17 ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(11)