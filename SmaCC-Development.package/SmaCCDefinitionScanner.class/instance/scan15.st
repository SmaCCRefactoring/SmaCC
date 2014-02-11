generated
scan15
	self recordMatch: #(26).
	self step.
	currentCharacter = $n
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $o
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter = $t
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter = $_
																ifTrue: [ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter = $t
																		ifTrue: [ 
																			self recordMatch: #(26).
																			self step.
																			currentCharacter = $o
																				ifTrue: [ 
																					self recordMatch: #(26).
																					self step.
																					currentCharacter = $k
																						ifTrue: [ 
																							self recordMatch: #(26).
																							self step.
																							currentCharacter = $e
																								ifTrue: [ 
																									self recordMatch: #(26).
																									self step.
																									currentCharacter = $n
																										ifTrue: [ 
																											self recordMatch: #(26).
																											self step.
																											currentCharacter = $s
																												ifTrue: [ 
																													self recordMatch: #(23 26).
																													self step.
																													(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																														ifTrue: [ 
																															[ 
																															self recordMatch: #(26).
																															self step.
																															currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
																													^ self reportLastMatch ] ].
																									(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																										ifTrue: [ 
																											[ 
																											self recordMatch: #(26).
																											self step.
																											currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
																									^ self reportLastMatch ] ].
																					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																						ifTrue: [ 
																							[ 
																							self recordMatch: #(26).
																							self step.
																							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
																					^ self reportLastMatch ] ].
																	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																		ifTrue: [ 
																			[ 
																			self recordMatch: #(26).
																			self step.
																			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
																	^ self reportLastMatch ].
															currentCharacter isAlphaNumeric
																ifTrue: [ 
																	[ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
															^ self reportLastMatch ] ].
											(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
												ifTrue: [ 
													[ 
													self recordMatch: #(26).
													self step.
													currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
											^ self reportLastMatch ] ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $b
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter = $t
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter = $s
																		ifTrue: [ 
																			self recordMatch: #(12 26).
																			self step ].
																	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																		ifTrue: [ 
																			[ 
																			self recordMatch: #(26).
																			self step.
																			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
																	^ self reportLastMatch ] ].
													(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
														ifTrue: [ 
															[ 
															self recordMatch: #(26).
															self step.
															currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
													^ self reportLastMatch ] ].
									(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
										ifTrue: [ 
											[ 
											self recordMatch: #(26).
											self step.
											currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
									^ self reportLastMatch ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(26).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ] ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(26).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch