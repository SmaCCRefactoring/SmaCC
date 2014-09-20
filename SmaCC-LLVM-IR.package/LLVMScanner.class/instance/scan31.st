generated
scan31
	self step.
	currentCharacter = $i
		ifTrue: [ 
			self step.
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
																				ifTrue: [ ^ self recordAndReportMatch: #(46) ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch