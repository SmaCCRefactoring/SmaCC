generated
scan19
	self recordMatch: #(26).
	self step.
	currentCharacter == $n
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $n
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $o
						ifTrue: [ 
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
											currentCharacter == $t
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter == $e
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter == $_
																ifTrue: [ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter == $t
																		ifTrue: [ 
																			self recordMatch: #(26).
																			self step.
																			currentCharacter == $o
																				ifTrue: [ 
																					self recordMatch: #(26).
																					self step.
																					currentCharacter == $k
																						ifTrue: [ 
																							self recordMatch: #(26).
																							self step.
																							currentCharacter == $e
																								ifTrue: [ 
																									self recordMatch: #(26).
																									self step.
																									currentCharacter == $n
																										ifTrue: [ 
																											self recordMatch: #(26).
																											self step.
																											currentCharacter == $s
																												ifTrue: [ 
																													self recordMatch: #(23 26).
																													self step.
																													(currentCharacter isLetter
																														or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
																														ifTrue: [ 
																															[ 
																															self recordMatch: #(26).
																															self step.
																															currentCharacter isLetter
																																or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ] whileTrue ].
																													^ self reportLastMatch ] ].
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
																							currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ]
																								whileTrue ].
																					^ self reportLastMatch ] ].
																	(currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ])
																		ifTrue: [ 
																			[ 
																			self recordMatch: #(26).
																			self step.
																			currentCharacter isLetter or: [ currentCharacter isHexDigit or: [ currentCharacter == $_ ] ] ]
																				whileTrue ].
																	^ self reportLastMatch ].
															(currentCharacter isLetter or: [ currentCharacter isHexDigit ])
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
			^ self reportLastMatch ].
	currentCharacter == $t
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter == $t
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter == $r
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter == $i
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter == $b
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter == $u
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
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
																			self recordMatch: #(12 26).
																			self step ].
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