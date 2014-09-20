generated
scan37
	self step.
	currentCharacter = $t
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $x
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self step.
															currentCharacter = $c
																ifTrue: [ ^ self recordAndReportMatch: #(58) ] ] ] ] ] ] ] ].
	^ self reportLastMatch