generated
scan19
	[ 
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(35) ] ] repeat