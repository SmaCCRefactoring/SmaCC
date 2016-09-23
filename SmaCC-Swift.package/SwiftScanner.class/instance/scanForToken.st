generated
scanForToken
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scanForTokenX2 ].
	^ self scanForTokenX16