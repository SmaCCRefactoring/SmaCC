generated
scan17
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #(28).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter = $'
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $/
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $:
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter = $<
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $e
		ifTrue: [ ^ self scan12 ].
	currentCharacter = ${
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter = ${
				ifTrue: [ ^ self recordAndReportMatch: #(39) ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = $}
		ifTrue: [ 
			self step.
			currentCharacter = $}
				ifTrue: [ ^ self recordAndReportMatch: #(40) ].
			^ self reportLastMatch ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(24).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(26).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch