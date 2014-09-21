generated
scan22
	[ 
	self recordMatch: #(245 252).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch