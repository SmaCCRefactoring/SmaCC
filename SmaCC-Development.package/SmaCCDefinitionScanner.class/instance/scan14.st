generated
scan14
	[ 
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(39) ] ] repeat