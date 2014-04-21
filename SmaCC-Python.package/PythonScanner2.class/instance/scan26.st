generated
scan26
	[ 
	self recordMatch: #(73).
	self step.
	currentCharacter = $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch