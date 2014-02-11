generated
scan18
	self step.
	currentCharacter = Character newPage
		ifTrue: [ 
			self recordMatch: #(24 37).
			self step.
			(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
				ifTrue: [ 
					[ 
					self recordMatch: #(24).
					self step.
					currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan3 ].
			^ self scan2 ].
	currentCharacter = $#
		ifTrue: [ 
			self recordMatch: #(28 37).
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(28).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ ^ self recordAndReportMatch: #(32 37) ].
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(5 37) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(4 37) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(3 37) ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(31 37).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(33 37) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ ^ self scan11 ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(6 37) ].
	currentCharacter = $[
		ifTrue: [ 
			self step.
			currentCharacter = $\
				ifTrue: [ ^ self scan20 ].
			(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
				ifTrue: [ ^ self scan19 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			currentCharacter = $c
				ifTrue: [ 
					self step.
					(currentCharacter between: $A and: $Z)
						ifTrue: [ ^ self recordAndReportMatch: #(34) ].
					^ self reportLastMatch ].
			currentCharacter = $x
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							3
								timesRepeat: [ 
									self recordMatch: #(34).
									self step.
									currentCharacter isHexDigit
										ifFalse: [ ^ self reportLastMatch ] ].
							^ self recordAndReportMatch: #(34) ].
					^ self reportLastMatch ].
			^ self recordAndReportMatch: #(34) ].
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(26 37).
			self step.
			currentCharacter = $r
				ifTrue: [ ^ self scan13 ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter = $,
				ifTrue: [ ^ self scan21 ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $,
						ifTrue: [ ^ self scan21 ].
					currentCharacter isDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(2 37) ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(24).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ 
			self recordMatch: #(26 37).
			self step.
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(37)