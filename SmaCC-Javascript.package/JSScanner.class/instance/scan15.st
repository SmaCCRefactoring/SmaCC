generated
scan15
	[ 
	self step.
	currentCharacter = $\
		ifTrue: [ 
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ ^ self scan15 ].
			^ self reportLastMatch ].
	currentCharacter = $]
		ifTrue: [ ^ self scan11 ] ] repeat