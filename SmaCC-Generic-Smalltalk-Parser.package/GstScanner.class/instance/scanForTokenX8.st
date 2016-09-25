generated
scanForTokenX8
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $`
		ifTrue: [ ^ self scan16 ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX5 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter isSpecial
		ifTrue:
			[ ^ self scanForTokenX6 ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue: [ [ self recordMatch: #(15).
			self step.
			currentCharacter == $:
				ifTrue: [ ^ self recordAndReportMatch: #(16) ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch