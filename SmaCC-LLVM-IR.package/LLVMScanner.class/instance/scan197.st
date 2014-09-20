generated
scan197
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $z
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									currentCharacter = $d
										ifTrue: [ 
											self step.
											currentCharacter = $:
												ifTrue: [ ^ self recordAndReportMatch: #(258) ].
											currentCharacter = $_
												ifTrue: [ 
													self step.
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(258) ].
													currentCharacter = $c
														ifTrue: [ 
															self step.
															currentCharacter = $:
																ifTrue: [ ^ self recordAndReportMatch: #(258) ].
															currentCharacter = $h
																ifTrue: [ 
																	self step.
																	currentCharacter = $:
																		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																	currentCharacter = $e
																		ifTrue: [ 
																			self step.
																			currentCharacter = $:
																				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																			currentCharacter = $c
																				ifTrue: [ 
																					self step.
																					currentCharacter = $:
																						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																					currentCharacter = $k
																						ifTrue: [ 
																							self step.
																							currentCharacter = $:
																								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																							currentCharacter = $s
																								ifTrue: [ 
																									self recordMatch: #(50).
																									self step.
																									currentCharacter = $:
																										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																									(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
																										ifTrue: [ ^ self scan5 ].
																									^ self reportLastMatch ] ].
																					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
																						ifTrue: [ ^ self scan5 ].
																					^ self reportLastMatch ] ].
																	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
																		ifTrue: [ ^ self scan5 ].
																	^ self reportLastMatch ] ].
													(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
														ifTrue: [ ^ self scan5 ].
													^ self reportLastMatch ] ].
									(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
										ifTrue: [ ^ self scan5 ].
									^ self reportLastMatch ] ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ] ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch