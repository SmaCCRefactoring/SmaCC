generated
scan22
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $p
				ifTrue: [ ^ self recordAndReportMatch: #(45) ].
			^ self reportLastMatch ].
	currentCharacter = $m
		ifTrue: [ 
			self step.
			currentCharacter = $_
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $p
										ifTrue: [ 
											self step.
											currentCharacter = $c
												ifTrue: [ 
													self step.
													currentCharacter = $s
														ifTrue: [ 
															self step.
															currentCharacter = $_
																ifTrue: [ 
																	self step.
																	currentCharacter = $v
																		ifTrue: [ 
																			self step.
																			currentCharacter = $f
																				ifTrue: [ 
																					self step.
																					currentCharacter = $p
																						ifTrue: [ 
																							2
																								timesRepeat: [ 
																									self step.
																									currentCharacter = $c
																										ifFalse: [ ^ self reportLastMatch ] ].
																							^ self recordAndReportMatch: #(157) ] ] ].
																	^ self reportLastMatch ].
															currentCharacter = $c
																ifTrue: [ 
																	self step.
																	currentCharacter = $c
																		ifTrue: [ ^ self recordAndReportMatch: #(161) ] ] ] ] ].
									^ self reportLastMatch ].
							currentCharacter = $p
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ 
											self step.
											currentCharacter = $s
												ifTrue: [ 
													2
														timesRepeat: [ 
															self step.
															currentCharacter = $c
																ifFalse: [ ^ self reportLastMatch ] ].
													^ self recordAndReportMatch: #(159) ] ] ] ] ] ].
	^ self reportLastMatch