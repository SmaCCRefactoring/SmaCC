generated
scanSplitSeq25
	currentCharacter = $t
		ifTrue: [ ^ self scanSplit24 ].
	currentCharacter = $w
		ifTrue: [ ^ self scanSplit4 ].
	currentCharacter = $y
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $i
				ifTrue: [ ^ self scanSplit2 ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $h) or: [ currentCharacter between: $j and: $z ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(85) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(40).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(29) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(86) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(73).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan9 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan10 ].
			('Ljl' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(73) ].
			^ self reportLastMatch ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #(79).
			self step.
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	('BUu' includes: currentCharacter)
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan5 ].
			('Rr' includes: currentCharacter)
				ifTrue: [ ^ self scan13 ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Q)
						or: [ 
							(currentCharacter between: $S and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isSafeForHTTP
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch