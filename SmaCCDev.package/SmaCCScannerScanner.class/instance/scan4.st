generated-scanner
scan4
	self step.
	(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	^ self reportLastMatch