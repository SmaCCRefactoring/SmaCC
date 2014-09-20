generated
scan198
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $m
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
											currentCharacter = $a
												ifTrue: [ 
													2
														timesRepeat: [ 
															self step.
															currentCharacter = $:
																ifTrue: [ ^ self recordAndReportMatch: #(258) ].
															currentCharacter = $d
																ifFalse: [ 
																	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
																		ifTrue: [ ^ self scan5 ].
																	^ self reportLastMatch ] ].
													self step.
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(258) ].
													currentCharacter = $r
														ifTrue: [ 
															self recordMatch: #(87).
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
	^ self reportLastMatch