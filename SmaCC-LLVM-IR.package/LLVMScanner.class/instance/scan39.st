generated
scan39
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $_
						ifTrue: [ 
							self step.
							currentCharacter = $o
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ 
											self step.
											currentCharacter = $l
												ifTrue: [ 
													self step.
													currentCharacter = $_
														ifTrue: [ 
															self step.
															currentCharacter = $b
																ifTrue: [ 
																	self step.
																	currentCharacter = $i
																		ifTrue: [ 
																			2
																				timesRepeat: [ 
																					self step.
																					currentCharacter = $c
																						ifFalse: [ ^ self reportLastMatch ] ].
																			^ self recordAndReportMatch: #(179) ] ] ] ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $d
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
															currentCharacter = $c
																ifTrue: [ 
																	self step.
																	currentCharacter = $t
																		ifTrue: [ ^ self recordAndReportMatch: #(218) ] ] ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $l
										ifTrue: [ ^ self recordAndReportMatch: #(136) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $p
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self step.
									currentCharacter = $r
										ifTrue: [ ^ self recordAndReportMatch: #(199) ] ] ] ] ].
	^ self reportLastMatch