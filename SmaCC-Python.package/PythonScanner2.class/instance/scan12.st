generated
scan12
	[ 
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan9 ].
	currentCharacter = $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch