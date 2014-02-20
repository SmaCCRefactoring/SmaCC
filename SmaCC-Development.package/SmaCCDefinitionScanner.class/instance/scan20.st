generated
scan20
	[ 
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(39) ] ] repeat