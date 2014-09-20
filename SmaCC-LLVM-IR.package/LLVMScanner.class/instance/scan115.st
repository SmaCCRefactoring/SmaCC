generated
scan115
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $k
						ifTrue: [ 
							self recordMatch: #(129).
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $_
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									currentCharacter = $d
										ifTrue: [ 
											self step.
											currentCharacter = $:
												ifTrue: [ ^ self recordAndReportMatch: #(258) ].
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(258) ].
													currentCharacter = $f
														ifTrue: [ 
															self step.
															currentCharacter = $:
																ifTrue: [ ^ self recordAndReportMatch: #(258) ].
															currentCharacter = $_
																ifTrue: [ 
																	self step.
																	currentCharacter = $:
																		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																	currentCharacter = $a
																		ifTrue: [ 
																			self step.
																			currentCharacter = $:
																				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																			currentCharacter = $u
																				ifTrue: [ 
																					self step.
																					currentCharacter = $:
																						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																					currentCharacter = $t
																						ifTrue: [ 
																							self step.
																							currentCharacter = $:
																								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																							currentCharacter = $o
																								ifTrue: [ 
																									self recordMatch: #(137).
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