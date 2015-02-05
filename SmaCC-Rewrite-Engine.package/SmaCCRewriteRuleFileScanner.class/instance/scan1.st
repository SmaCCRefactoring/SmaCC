generated
scan1
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ] ] repeat