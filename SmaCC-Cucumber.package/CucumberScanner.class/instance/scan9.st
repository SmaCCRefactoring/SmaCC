generated
scan9
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
		ifTrue: [ ^ self recordAndReportMatch: #(9 11) ].
	currentCharacter = $A
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $n
				ifTrue: [ ^ self scan11 ].
			^ self reportLastMatch ].
	currentCharacter = $B
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $a
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $u
				ifTrue: [ ^ self scan14 ].
			^ self reportLastMatch ].
	currentCharacter = $E
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $x
				ifTrue: [ ^ self scan16 ].
			^ self reportLastMatch ].
	currentCharacter = $F
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self scan18 ].
			^ self reportLastMatch ].
	currentCharacter = $G
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $i
				ifTrue: [ ^ self scan20 ].
			^ self reportLastMatch ].
	currentCharacter = $S
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $c
				ifTrue: [ ^ self scan23 ].
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
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter = $A
				ifTrue: [ ^ self scan10 ].
			currentCharacter = $B
				ifTrue: [ ^ self scan12 ].
			currentCharacter = $E
				ifTrue: [ ^ self scan15 ].
			currentCharacter = $F
				ifTrue: [ ^ self scan17 ].
			currentCharacter = $G
				ifTrue: [ ^ self scan19 ].
			currentCharacter = $S
				ifTrue: [ ^ self scan22 ].
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
						ifTrue: [ ^ self recordAndReportMatch: #(9) ].
					currentCharacter = $A
						ifTrue: [ ^ self scan10 ].
					currentCharacter = $B
						ifTrue: [ ^ self scan12 ].
					currentCharacter = $E
						ifTrue: [ ^ self scan15 ].
					currentCharacter = $F
						ifTrue: [ ^ self scan17 ].
					currentCharacter = $G
						ifTrue: [ ^ self scan19 ].
					currentCharacter = $S
						ifTrue: [ ^ self scan22 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(8) ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
			('TW' includes: currentCharacter)
				ifTrue: [ ^ self scan24 ].
			^ self reportLastMatch ].
	('TW' includes: currentCharacter)
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $h
				ifTrue: [ ^ self scan21 ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(11)