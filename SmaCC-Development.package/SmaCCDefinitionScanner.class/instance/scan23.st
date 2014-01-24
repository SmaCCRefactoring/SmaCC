generated
scan23
	self recordMatch: #(26).
	self step.
	currentCharacter == $i
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $e
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $r
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
											currentCharacter == $c
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter == $h
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter == $y
																ifTrue: [ 
																	self recordMatch: #(11 26).
																	self step.
																	(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
																		ifTrue: [ 
																			[ 
																			self recordMatch: #(26).
																			self step.
																			currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ]
																				whileTrue ].
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
					^ self reportLastMatch ] ].
	(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(26).
			self step.
			currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
	^ self reportLastMatch