generated
scan63
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
									currentCharacter = $a
										ifTrue: [ 
											self step.
											currentCharacter = $l
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
																			currentCharacter = $d
																				ifTrue: [ 
																					self step.
																					currentCharacter = $_
																						ifTrue: [ 
																							self step.
																							currentCharacter = $c
																								ifTrue: [ 
																									self step.
																									currentCharacter = $h
																										ifTrue: [ 
																											self step.
																											currentCharacter = $e
																												ifTrue: [ 
																													self step.
																													currentCharacter = $c
																														ifTrue: [ 
																															self step.
																															currentCharacter = $k
																																ifTrue: [ 
																																	self step.
																																	currentCharacter = $s
																																		ifTrue: [ ^ self recordAndReportMatch: #(50) ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch