generated
scan18
	[ 
	self recordMatch: #(245 252).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch