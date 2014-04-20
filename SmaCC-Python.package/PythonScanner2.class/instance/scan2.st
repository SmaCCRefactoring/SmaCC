generated
scan2
	[ 
	self recordMatch: #(79).
	self step.
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self reportLastMatch