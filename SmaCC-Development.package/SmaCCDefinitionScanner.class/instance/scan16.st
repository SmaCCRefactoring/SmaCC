generated
scan16
	self recordMatch: #(26).
	self step.
	currentCharacter = $d
		ifTrue: [ 
			self recordMatch: #(18 26).
			self step.
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $g
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
							currentCharacter = $r
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
													currentCharacter = $v
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter = $a
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
																					currentCharacter = $a
																						ifTrue: [ 
																							self recordMatch: #(26).
																							self step.
																							currentCharacter = $b
																								ifTrue: [ 
																									self recordMatch: #(26).
																									self step.
																									currentCharacter = $l
																										ifTrue: [ 
																											self recordMatch: #(26).
																											self step.
																											currentCharacter = $e
																												ifTrue: [ 
																													self recordMatch: #(26).
																													self step.
																													currentCharacter = $s
																														ifTrue: [ 
																															self recordMatch: #(22 26).
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
													^ self reportLastMatch ].
											currentCharacter = $c
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter = $a
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter = $s
																ifTrue: [ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter = $e
																		ifTrue: [ 
																			self recordMatch: #(21 26).
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
													^ self reportLastMatch ].
											currentCharacter isAlphaNumeric
												ifTrue: [ 
													[ 
													self recordMatch: #(26).
													self step.
													currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
											^ self reportLastMatch ].
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