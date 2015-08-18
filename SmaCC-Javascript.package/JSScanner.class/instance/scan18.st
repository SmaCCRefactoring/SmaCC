generated
scan18
	[ 
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self recordMatch: #(86).
			self step.
			currentCharacter = $`
				ifTrue: [ ^ self scan18 ].
			^ self reportLastMatch ] ] repeat