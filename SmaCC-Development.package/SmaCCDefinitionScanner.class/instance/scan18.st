generated
scan18
	self recordMatch: #(30).
	self step.
	currentCharacter = $i
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $r
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $c
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $h
														ifTrue: [ 
															self recordMatch: #(30).
															self step.
															currentCharacter = $y
																ifTrue: [ 
																	self recordMatch: #(15 30).
																	self step.
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