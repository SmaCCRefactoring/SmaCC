generated
scan70
	self step.
	currentCharacter = $4
		ifTrue: [ 
			self step.
			currentCharacter = $_
				ifTrue: [ 
					self step.
					currentCharacter = $s
						ifTrue: [ 
							self step.
							currentCharacter = $y
								ifTrue: [ 
									self step.
									currentCharacter = $s
										ifTrue: [ 
											self step.
											currentCharacter = $v
												ifTrue: [ 
													2
														timesRepeat: [ 
															self step.
															currentCharacter = $c
																ifFalse: [ ^ self reportLastMatch ] ].
													^ self recordAndReportMatch: #(167) ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $w
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $6
												ifTrue: [ 
													self step.
													currentCharacter = $4
														ifTrue: [ 
															2
																timesRepeat: [ 
																	self step.
																	currentCharacter = $c
																		ifFalse: [ ^ self reportLastMatch ] ].
															^ self recordAndReportMatch: #(169) ] ] ] ] ] ] ].
	^ self reportLastMatch