generated
scan15
	self recordMatch: #(30).
	self step.
	currentCharacter = $n
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $t
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $b
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $t
														ifTrue: [ 
															self recordMatch: #(30).
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self recordMatch: #(30).
																	self step.
																	currentCharacter = $s
																		ifTrue: [ 
																			self recordMatch: #(16 30).
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