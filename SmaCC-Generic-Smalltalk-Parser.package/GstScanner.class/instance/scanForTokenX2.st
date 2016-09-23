generated
scanForTokenX2
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(20).
			self step.
			currentCharacter isSpecial ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(20).
			self step.
			currentCharacter == $:
				ifTrue: [ ^ self scan2 ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch