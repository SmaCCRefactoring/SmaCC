generated
scan1X22
	currentCharacter == $^
		ifTrue:
			[ ^ self scan1X12 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(46) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(85) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scan1X11 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(86) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan1X3 ].
	(currentCharacter == Character tab
		or: [ currentCharacter == Character space ])
		ifTrue:
			[ ^ self scan1X10 ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan14 ].
	('BUbu' includes: currentCharacter)
		ifTrue:
			[ ^ self scan1X2 ].
	currentCharacter isSafeForHTTP
		ifTrue:
			[ self scan1X4 ].
	^ self reportLastMatch