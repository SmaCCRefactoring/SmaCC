generated
scanForToken
	self step.
	currentCharacter == $"
		ifTrue: [ [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			true ] whileTrue ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $0
		ifTrue: [ ^ self scan4 ].
	^ self scanForTokenX9