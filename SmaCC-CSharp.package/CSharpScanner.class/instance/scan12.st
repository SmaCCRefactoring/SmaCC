generated
scan12
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(158).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ] ] repeat