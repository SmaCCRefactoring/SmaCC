generated
scan12
	[ self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	true ] whileTrue