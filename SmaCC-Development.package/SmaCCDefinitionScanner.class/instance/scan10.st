generated
scan10
	[ self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(39) ].
	true ] whileTrue