generated
scan17
	self step.
	currentCharacter == $'
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			(currentCharacter isLetter or: [ currentCharacter == $_ ])
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter == (Character value: 12)
		ifTrue: [ 
			self recordMatch: #(24 37).
			self step.
			currentCharacter isWhitespace
				ifTrue: [ 
					[ 
					self recordMatch: #(24).
					self step.
					currentCharacter isWhitespace ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $"
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan4 ].
			^ self scan3 ].
	currentCharacter == $#
		ifTrue: [ 
			self recordMatch: #(28 37).
			self step.
			(currentCharacter <= (Character value: 9)
				or: [ 
					(currentCharacter between: (Character value: 11) and: (Character value: 12))
						or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(28).
					self step.
					currentCharacter <= (Character value: 9)
						or: [ 
							(currentCharacter between: (Character value: 11) and: (Character value: 12))
								or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(32 37) ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(6 37) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(3 37) ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter == $/
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter == $*
				ifTrue: [ ^ self scan6 ].
			^ self reportLastMatch ].
	currentCharacter == $:
		ifTrue: [ 
			self recordMatch: #(31 37).
			self step.
			currentCharacter == $:
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(33 37) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(5 37) ].
	currentCharacter == $[
		ifTrue: [ 
			self step.
			currentCharacter == $\
				ifTrue: [ ^ self scan14 ].
			(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
				ifTrue: [ ^ self scan13 ].
			^ self reportLastMatch ].
	currentCharacter == $\
		ifTrue: [ 
			self step.
			currentCharacter == $c
				ifTrue: [ 
					self step.
					(currentCharacter between: $A and: $Z)
						ifTrue: [ ^ self recordAndReportMatch: #(34) ].
					^ self reportLastMatch ].
			currentCharacter == $x
				ifTrue: [ 
					self step.
					(currentCharacter isHexDigit or: [ currentCharacter between: $a and: $f ])
						ifTrue: [ 
							3
								timesRepeat: [ 
									self recordMatch: #(34).
									self step.
									(currentCharacter isHexDigit or: [ currentCharacter between: $a and: $f ])
										ifFalse: [ ^ self reportLastMatch ] ].
							^ self recordAndReportMatch: #(34) ].
					^ self reportLastMatch ].
			^ self recordAndReportMatch: #(34) ].
	currentCharacter == ${
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter == $,
				ifTrue: [ ^ self scan15 ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self step.
					currentCharacter == $,
						ifTrue: [ ^ self scan15 ].
					currentCharacter isDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(1 37) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(4 37) ].
	currentCharacter == $<
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			(currentCharacter isLetter or: [ currentCharacter == $_ ])
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	currentCharacter == $e
		ifTrue: [ 
			self recordMatch: #(26 37).
			self step.
			currentCharacter == $r
				ifTrue: [ ^ self scan12 ].
			(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isWhitespace
		ifTrue: [ 
			[ 
			self recordMatch: #(24).
			self step.
			currentCharacter isWhitespace ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ 
			self recordMatch: #(26 37).
			self step.
			(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(37)