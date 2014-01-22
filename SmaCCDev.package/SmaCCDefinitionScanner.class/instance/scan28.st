generated
scan28
	self recordMatch: #(26).
	self step.
	currentCharacter == $t
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $a
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $r
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter == $t
								ifTrue: [ 
									self recordMatch: #(19 26).
									self step ].
							(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
							^ self reportLastMatch ].
					currentCharacter == $t
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter == $e
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter == $s
										ifTrue: [ 
											self recordMatch: #(8 26).
											self step.
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
			^ self reportLastMatch ].
	currentCharacter == $u
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $f
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
											self recordMatch: #(14 26).
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