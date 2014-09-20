generated
scan58
	self step.
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $_
						ifTrue: [ 
							self step.
							currentCharacter = $f
								ifTrue: [ 
									self step.
									currentCharacter = $u
										ifTrue: [ 
											self step.
											currentCharacter = $n
												ifTrue: [ 
													self step.
													currentCharacter = $c
														ifTrue: [ ^ self recordAndReportMatch: #(168) ] ] ].
									^ self reportLastMatch ].
							currentCharacter = $k
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self step.
													currentCharacter = $n
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self step.
																	currentCharacter = $l
																		ifTrue: [ ^ self recordAndReportMatch: #(160) ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch