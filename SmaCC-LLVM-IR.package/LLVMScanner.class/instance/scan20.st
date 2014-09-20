generated
scan20
	self step.
	currentCharacter = $d
		ifTrue: [ 
			self recordMatch: #(85).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $s
								ifTrue: [ 
									self step.
									currentCharacter = $s
										ifTrue: [ 
											self step.
											currentCharacter = $_
												ifTrue: [ 
													self step.
													currentCharacter = $s
														ifTrue: [ 
															self step.
															currentCharacter = $a
																ifTrue: [ 
																	self step.
																	currentCharacter = $f
																		ifTrue: [ 
																			self step.
																			currentCharacter = $e
																				ifTrue: [ 
																					self step.
																					currentCharacter = $t
																						ifTrue: [ 
																							self step.
																							currentCharacter = $y
																								ifTrue: [ ^ self recordAndReportMatch: #(48) ] ] ] ] ] ] ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $s
						ifTrue: [ 
							self step.
							currentCharacter = $p
								ifTrue: [ 
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self step.
											currentCharacter = $c
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self recordMatch: #(20).
															self step.
															currentCharacter = $c
																ifTrue: [ 
																	self step.
																	currentCharacter = $a
																		ifTrue: [ 
																			self step.
																			currentCharacter = $s
																				ifTrue: [ 
																					self step.
																					currentCharacter = $t
																						ifTrue: [ ^ self recordAndReportMatch: #(200) ] ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch