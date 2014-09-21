generated
scan19
	[ 
	self recordMatch: #(264).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
		whileTrue.
	^ self reportLastMatch