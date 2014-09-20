generated
scan56
	self step.
	currentCharacter = $l
		ifTrue: [ ^ self recordAndReportMatch: #(115) ].
	currentCharacter = $u
		ifTrue: [ 
			2
				timesRepeat: [ 
					self step.
					currentCharacter = $f
						ifFalse: [ ^ self reportLastMatch ] ].
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $v
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $c
												ifTrue: [ 
													self step.
													currentCharacter = $t
														ifTrue: [ 
															self step.
															currentCharacter = $o
																ifTrue: [ 
																	self step.
																	currentCharacter = $r
																		ifTrue: [ ^ self recordAndReportMatch: #(72) ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch