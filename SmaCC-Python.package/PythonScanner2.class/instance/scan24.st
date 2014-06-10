generated
scan24
	[ 
	self recordMatch: #(73).
	self step.
	currentCharacter = $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan25 ].
	^ self reportLastMatch