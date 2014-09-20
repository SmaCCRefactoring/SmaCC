generated
scan54
	self step.
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $z
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $_
														ifTrue: [ 
															self step.
															currentCharacter = $a
																ifTrue: [ 
																	self step.
																	currentCharacter = $d
																		ifTrue: [ 
																			self step.
																			currentCharacter = $d
																				ifTrue: [ 
																					self step.
																					currentCharacter = $r
																						ifTrue: [ 
																							self step.
																							currentCharacter = $e
																								ifTrue: [ 
																									2
																										timesRepeat: [ 
																											self step.
																											currentCharacter = $s
																												ifFalse: [ ^ self reportLastMatch ] ].
																									^ self recordAndReportMatch: #(9) ] ] ] ].
																	^ self reportLastMatch ].
															currentCharacter = $m
																ifTrue: [ 
																	self step.
																	currentCharacter = $e
																		ifTrue: [ 
																			self step.
																			currentCharacter = $m
																				ifTrue: [ 
																					self step.
																					currentCharacter = $o
																						ifTrue: [ 
																							self step.
																							currentCharacter = $r
																								ifTrue: [ 
																									self step.
																									currentCharacter = $y
																										ifTrue: [ ^ self recordAndReportMatch: #(27) ] ] ] ] ].
																	^ self reportLastMatch ].
															currentCharacter = $t
																ifTrue: [ 
																	self step.
																	currentCharacter = $h
																		ifTrue: [ 
																			self step.
																			currentCharacter = $r
																				ifTrue: [ 
																					self step.
																					currentCharacter = $e
																						ifTrue: [ 
																							self step.
																							currentCharacter = $a
																								ifTrue: [ 
																									self step.
																									currentCharacter = $d
																										ifTrue: [ ^ self recordAndReportMatch: #(23) ] ] ] ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch