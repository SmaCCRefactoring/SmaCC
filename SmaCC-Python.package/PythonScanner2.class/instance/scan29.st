generated
scan29
	[ 
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan24 ].
	currentCharacter = $j
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan25 ].
	^ self reportLastMatch