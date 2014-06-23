generated
scan16
	[ 
	self recordMatch: #(7).
	self step.
	currentCharacter = $#
		ifTrue: [ ^ self scan17 ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self reportLastMatch