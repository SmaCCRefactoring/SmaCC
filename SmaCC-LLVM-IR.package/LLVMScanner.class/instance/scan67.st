generated
scan67
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $_
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									currentCharacter = $w
										ifTrue: [ 
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
																	self recordMatch: #(146).
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
									^ self reportLastMatch ].
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									currentCharacter = $l
										ifTrue: [ 
											self recordMatch: #(176).
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
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $a
				ifTrue: [ ^ self scan68 ] ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch