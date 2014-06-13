generated
scan23
	self recordMatch: #(30).
	self step.
	currentCharacter = $r
		ifTrue: [ 
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
							currentCharacter = $i
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $x
										ifTrue: [ 
											self recordMatch: #(17 30).
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
					^ self reportLastMatch ] ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch