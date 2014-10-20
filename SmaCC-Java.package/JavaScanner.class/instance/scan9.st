generated
scan9
	[ 
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self recordMatch: #(107).
			self step.
			currentCharacter = $`
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ] ] repeat