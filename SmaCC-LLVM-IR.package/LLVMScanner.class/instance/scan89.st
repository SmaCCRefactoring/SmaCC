generated
scan89
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $t
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $:
												ifTrue: [ ^ self recordAndReportMatch: #(258) ].
											currentCharacter = $x
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
																	self recordMatch: #(58).
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
	^ self reportLastMatch