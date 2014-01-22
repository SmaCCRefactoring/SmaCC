generated
scan25
	self recordMatch: #(26).
	self step.
	currentCharacter == $o
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $n
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $a
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter == $s
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter == $s
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter == $o
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter == $c
														ifTrue: [ 
															self recordMatch: #(17 26).
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
					^ self reportLastMatch ] ].
	(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(26).
			self step.
			currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
	^ self reportLastMatch