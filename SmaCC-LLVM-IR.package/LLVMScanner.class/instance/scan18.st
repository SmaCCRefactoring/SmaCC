generated
scan18
	[ 
	self recordMatch: #(246 253).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch