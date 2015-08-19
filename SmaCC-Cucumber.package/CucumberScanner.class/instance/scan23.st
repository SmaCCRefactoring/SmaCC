generated
scan23
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self step.
											currentCharacter = $o
												ifTrue: [ 
													self step.
													currentCharacter = Character space
														ifTrue: [ 
															self step.
															currentCharacter = $O
																ifTrue: [ 
																	self step.
																	currentCharacter = $u
																		ifTrue: [ 
																			self step.
																			currentCharacter = $t
																				ifTrue: [ 
																					self step.
																					currentCharacter = $l
																						ifTrue: [ 
																							self step.
																							currentCharacter = $i
																								ifTrue: [ 
																									self step.
																									currentCharacter = $n
																										ifTrue: [ 
																											self step.
																											currentCharacter = $e
																												ifTrue: [ 
																													self step.
																													currentCharacter = $:
																														ifTrue: [ ^ self recordAndReportMatch: #(5) ] ] ] ] ] ] ] ].
															^ self reportLastMatch ].
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(3) ] ] ] ] ] ] ].
	^ self reportLastMatch