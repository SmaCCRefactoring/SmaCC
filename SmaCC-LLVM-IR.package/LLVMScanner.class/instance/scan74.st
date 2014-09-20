generated
scan74
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $v
				ifTrue: [ 
					self recordMatch: #(117).
					self step.
					currentCharacter = Character space
						ifTrue: [ 
							self step.
							currentCharacter = $'
								ifTrue: [ 
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self step.
											currentCharacter = $p
												ifTrue: [ 
													self step.
													currentCharacter = $c
														ifTrue: [ 
															self step.
															currentCharacter = $o
																ifTrue: [ 
																	self step.
																	currentCharacter = $d
																		ifTrue: [ 
																			self step.
																			currentCharacter = $e
																				ifTrue: [ ^ self recordAndReportMatch: #(46) ] ] ] ] ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ] ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch