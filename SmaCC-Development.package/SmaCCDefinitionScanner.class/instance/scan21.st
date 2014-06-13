generated
scan21
	self recordMatch: #(30).
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $f
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self recordMatch: #(19 30).
							self step ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(30).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ] ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch