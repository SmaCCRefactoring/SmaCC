generated
scan10
	[ 
	self recordMatch: #(73).
	self step.
	currentCharacter = $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch