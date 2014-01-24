generated
scan26
	self recordMatch: #(26).
	self step.
	currentCharacter == $r
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $e
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $f
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter == $i
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter == $x
										ifTrue: [ 
											self recordMatch: #(13 26).
											self step ].
									(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
										ifTrue: [ 
											[ 
											self recordMatch: #(26).
											self step.
											currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
									^ self reportLastMatch ] ].
					(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(26).
							self step.
							currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
					^ self reportLastMatch ] ].
	(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(26).
			self step.
			currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
	^ self reportLastMatch