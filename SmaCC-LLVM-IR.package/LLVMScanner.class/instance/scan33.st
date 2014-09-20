generated
scan33
	self step.
	currentCharacter = $c
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $m
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self step.
															currentCharacter = $n
																ifTrue: [ 
																	self step.
																	currentCharacter = $t
																		ifTrue: [ 
																			self step.
																			currentCharacter = $p
																				ifTrue: [ 
																					self step.
																					currentCharacter = $t
																						ifTrue: [ 
																							self step.
																							currentCharacter = $r
																								ifTrue: [ ^ self recordAndReportMatch: #(64) ] ] ] ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $b
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $l
										ifTrue: [ ^ self recordAndReportMatch: #(74) ] ] ] ] ].
	^ self reportLastMatch