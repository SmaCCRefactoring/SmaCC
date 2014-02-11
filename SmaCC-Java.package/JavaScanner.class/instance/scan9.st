generated
scan9
	[ 
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self recordMatch: #(105).
			self step.
			currentCharacter = $`
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ] ] repeat