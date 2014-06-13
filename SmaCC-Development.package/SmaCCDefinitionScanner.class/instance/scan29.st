generated
scan29
	[ 
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self scan30 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(39) ] ] repeat