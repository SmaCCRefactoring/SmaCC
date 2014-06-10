generated
scan9
	[ 
	self recordMatch: #(6).
	self step.
	currentCharacter = $#
		ifTrue: [ ^ self scan10 ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self reportLastMatch