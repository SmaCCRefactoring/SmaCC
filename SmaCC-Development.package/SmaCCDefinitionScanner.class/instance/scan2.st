generated
scan2
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(31).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ] ] repeat