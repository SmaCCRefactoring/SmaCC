generated
scan1
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
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
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $/
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $:
		ifTrue: [ ^ self scan9 ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter = $<
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $e
		ifTrue: [ ^ self scan13 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(28).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch