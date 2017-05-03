generated
scanForToken
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $$
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $(
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	^ self scanForTokenX14