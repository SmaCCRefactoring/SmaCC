generated
scan13
	[ 
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch