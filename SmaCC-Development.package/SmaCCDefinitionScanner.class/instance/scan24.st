generated
scan24
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
					currentCharacter == $t
						ifTrue: [ 
							self recordMatch: #(15 26).
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
	^ self reportLastMatch