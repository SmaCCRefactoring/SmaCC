generated
scan13
	self recordMatch: #(26).
	self step.
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(7 26).
							self step ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(26).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ] ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(26).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch