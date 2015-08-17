generated
scan2
	[ 
	self step.
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $'
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ] ] repeat