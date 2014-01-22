generated
scan20
	self recordMatch: #(26).
	self step.
	currentCharacter == $r
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $x
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $c
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $l
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter == $u
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter == $d
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter == $e
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter == $s
														ifTrue: [ 
															self recordMatch: #(9 26).
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