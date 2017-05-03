generated
scanForTokenX10
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX5 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter == $$ ])
		ifTrue:
			[ self scanForTokenX3 ].
	^ self reportLastMatch