generated-scanner
scan3
	[ 
	self step.
	currentCharacter <= $[ or: [ currentCharacter >= $^ ] ] whileTrue.
	currentCharacter = $\
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	^ self reportLastMatch