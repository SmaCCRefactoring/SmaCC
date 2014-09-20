generated
scan23
	self step.
	currentCharacter = $o
		ifTrue: [ 
			self step.
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $i
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self recordMatch: #(205).
									self step.
									currentCharacter = $r
										ifTrue: [ 
											self step.
											currentCharacter = $m
												ifTrue: [ 
													self step.
													currentCharacter = $w
														ifTrue: [ ^ self recordAndReportMatch: #(204) ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ 
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $i
						ifTrue: [ 
							self step.
							currentCharacter = $b
								ifTrue: [ 
									self step.
									currentCharacter = $u
										ifTrue: [ 
											self step.
											currentCharacter = $t
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self step.
															currentCharacter = $s
																ifTrue: [ ^ self recordAndReportMatch: #(82) ] ] ] ] ] ] ] ].
	^ self reportLastMatch