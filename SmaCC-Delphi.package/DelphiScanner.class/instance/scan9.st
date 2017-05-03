generated
scan9
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			currentCharacter == $* ] whileTrue.
			^ self scan9 ].
	true ] whileTrue