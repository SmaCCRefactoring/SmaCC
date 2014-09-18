generated
scan14
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #(32).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $/
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $:
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter = $<
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $a
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan17 ].
	currentCharacter = $g
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(24 30).
							self step.
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(30).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $h
		ifTrue: [ ^ self scan18 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan24 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan25 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	(currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(28).
			self step.
			currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch