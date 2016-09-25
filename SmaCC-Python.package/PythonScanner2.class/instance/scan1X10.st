generated
scan1X10
	[ self recordMatch: #(79).
	self step.
	currentCharacter == Character tab
		or: [ currentCharacter == Character space ] ] whileTrue.
	^ self reportLastMatch