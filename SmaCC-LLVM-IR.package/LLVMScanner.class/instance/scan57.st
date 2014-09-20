generated
scan57
	self step.
	currentCharacter = $d
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							2
								timesRepeat: [ 
									self step.
									currentCharacter = $f
										ifFalse: [ ^ self reportLastMatch ] ].
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ 
											self step.
											currentCharacter = $t
												ifTrue: [ ^ self recordAndReportMatch: #(219) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $g
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $x
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ ^ self recordAndReportMatch: #(39) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $g
				ifTrue: [ 
					self step.
					currentCharacter = $l
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self step.
											currentCharacter = $h
												ifTrue: [ 
													self step.
													currentCharacter = $r
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self step.
																	currentCharacter = $a
																		ifTrue: [ 
																			self step.
																			currentCharacter = $d
																				ifTrue: [ ^ self recordAndReportMatch: #(207) ] ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $f
						ifTrue: [ 
							self step.
							currentCharacter = $p
								ifTrue: [ ^ self recordAndReportMatch: #(189) ] ] ] ].
	^ self reportLastMatch