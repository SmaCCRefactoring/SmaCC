generated
scan14
	[ 
	self recordMatch: #(7).
	self step.
	currentCharacter = $#
		ifTrue: [ ^ self scan15 ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self reportLastMatch