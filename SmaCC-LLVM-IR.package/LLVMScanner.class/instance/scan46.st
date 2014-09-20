generated
scan46
	self step.
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $z
						ifTrue: [ 
							self step.
							currentCharacter = $y
								ifTrue: [ 
									self step.
									currentCharacter = $b
										ifTrue: [ 
											self step.
											currentCharacter = $i
												ifTrue: [ 
													self step.
													currentCharacter = $n
														ifTrue: [ 
															self step.
															currentCharacter = $d
																ifTrue: [ ^ self recordAndReportMatch: #(2) ] ] ] ] ] ] ] ].
	^ self reportLastMatch