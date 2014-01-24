generated
scan27
	self recordMatch: #(26).
	self step.
	currentCharacter == $i
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $g
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $h
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter == $t
								ifTrue: [ 
									self recordMatch: #(16 26).
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
			^ self reportLastMatch ].
	currentCharacter == $o
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $o
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $t
						ifTrue: [ 
							self recordMatch: #(10 26).
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