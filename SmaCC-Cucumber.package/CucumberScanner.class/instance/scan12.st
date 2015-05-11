generated
scan12
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $k
				ifTrue: [ 
					self step.
					currentCharacter = $g
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self step.
													currentCharacter = $n
														ifTrue: [ 
															self step.
															currentCharacter = $d
																ifTrue: [ 
																	self step.
																	currentCharacter = $:
																		ifTrue: [ ^ self recordAndReportMatch: #(7) ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch