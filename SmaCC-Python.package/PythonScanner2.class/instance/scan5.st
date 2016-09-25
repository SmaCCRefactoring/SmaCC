generated
scan5
	[ self step.
	currentCharacter == $"
		ifTrue: [ (self scanForString: '""')
				ifTrue: [ ^ self recordAndReportMatch: #(72) ].
			^ self scan5 ].
	currentCharacter == $\
		ifTrue: [ self step.
			^ self scan5 ].
	true ] whileTrue