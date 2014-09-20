generated
scan140
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $e
		ifTrue: [ ^ self scan141 ].
	currentCharacter = $h
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $i
				ifTrue: [ 
					self recordMatch: #(223).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $c
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter = $_
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(257) ].
							currentCharacter = $f
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(257) ].
									currentCharacter = $p
										ifTrue: [ 
											self step.
											currentCharacter = $1
												ifTrue: [ 
													self step.
													currentCharacter = $2
														ifTrue: [ 
															self step.
															currentCharacter = $8
																ifTrue: [ 
																	self recordMatch: #(125).
																	self step ].
															currentCharacter = $:
																ifTrue: [ ^ self recordAndReportMatch: #(257) ].
															(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
																ifTrue: [ ^ self scan5 ].
															^ self reportLastMatch ] ].
											currentCharacter = $:
												ifTrue: [ ^ self recordAndReportMatch: #(257) ].
											(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
												ifTrue: [ ^ self scan5 ].
											^ self reportLastMatch ] ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ ^ self scan142 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan149 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch