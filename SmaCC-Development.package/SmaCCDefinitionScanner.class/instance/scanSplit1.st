generated
scanSplit1
	self step.
	currentCharacter = Character newPage
		ifTrue: [ 
			self recordMatch: #(28 41).
			self step.
			(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
				ifTrue: [ 
					[ 
					self recordMatch: #(28).
					self step.
					currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
	currentCharacter = $#
		ifTrue: [ 
			self recordMatch: #(32 41).
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(32).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(36 41).
			self step.
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(8 41) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(2 41) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(1 41) ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(35 41).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(37 41) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			currentCharacter = $%
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ ^ self scan11 ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(5 41) ].
	currentCharacter = $[
		ifTrue: [ 
			self recordMatch: #(7).
			self step.
			currentCharacter = $\
				ifTrue: [ ^ self scan15 ].
			(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
				ifTrue: [ ^ self scan14 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			currentCharacter = $c
				ifTrue: [ 
					self step.
					(currentCharacter between: $A and: $Z)
						ifTrue: [ ^ self recordAndReportMatch: #(38) ].
					^ self reportLastMatch ].
			currentCharacter = $x
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							3
								timesRepeat: [ 
									self recordMatch: #(38).
									self step.
									currentCharacter isHexDigit
										ifFalse: [ ^ self reportLastMatch ] ].
							^ self recordAndReportMatch: #(38) ].
					^ self reportLastMatch ].
			^ self recordAndReportMatch: #(38) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6 41) ].
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(30 41).
			self step.
			currentCharacter = $r
				ifTrue: [ ^ self scan13 ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ 
			self recordMatch: #(33).
			self step.
			currentCharacter = $,
				ifTrue: [ ^ self scan16 ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $,
						ifTrue: [ ^ self scan16 ].
					currentCharacter isDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(4 41) ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(28).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ 
			self recordMatch: #(30 41).
			self step.
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(41)