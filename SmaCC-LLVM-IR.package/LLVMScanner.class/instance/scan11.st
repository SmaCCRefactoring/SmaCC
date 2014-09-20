generated
scan11
	[ 
	self recordMatch: #(246).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch