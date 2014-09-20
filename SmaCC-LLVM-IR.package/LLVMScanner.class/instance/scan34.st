generated
scan34
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $y
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $s
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									currentCharacter = $n
										ifTrue: [ 
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
															currentCharacter = $n
																ifTrue: [ 
																	self step.
																	currentCharacter = $:
																		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
																	currentCharacter = $e
																		ifTrue: [ 
																			self recordMatch: #(30).
																			self step.
																			currentCharacter = $:
																				ifTrue: [ ^ self recordAndReportMatch: #(258) ] ].
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