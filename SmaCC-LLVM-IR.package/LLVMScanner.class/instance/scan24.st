generated
scan24
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $l
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $b
										ifTrue: [ 
											self step.
											currentCharacter = $l
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self step.
															currentCharacter = $_
																ifTrue: [ 
																	self step.
																	currentCharacter = $e
																		ifTrue: [ 
																			self step.
																			currentCharacter = $x
																				ifTrue: [ 
																					self step.
																					currentCharacter = $t
																						ifTrue: [ 
																							self step.
																							currentCharacter = $e
																								ifTrue: [ 
																									self step.
																									currentCharacter = $r
																										ifTrue: [ 
																											self step.
																											currentCharacter = $n
																												ifTrue: [ 
																													self step.
																													currentCharacter = $a
																														ifTrue: [ 
																															2
																																timesRepeat: [ 
																																	self step.
																																	currentCharacter = $l
																																		ifFalse: [ ^ self reportLastMatch ] ].
																															self step.
																															currentCharacter = $y
																																ifTrue: [ ^ self recordAndReportMatch: #(138) ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch