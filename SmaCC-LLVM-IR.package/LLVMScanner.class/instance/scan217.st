generated
scan217
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $s
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter = $t
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(257) ].
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(257) ].
									currentCharacter = $a
										ifTrue: [ 
											2
												timesRepeat: [ 
													self step.
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(257) ].
													currentCharacter = $l
														ifFalse: [ 
															(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
																ifTrue: [ ^ self scan5 ].
															^ self reportLastMatch ] ].
											2
												timesRepeat: [ 
													self step.
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(257) ].
													currentCharacter = $c
														ifFalse: [ 
															(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
																ifTrue: [ ^ self scan5 ].
															^ self reportLastMatch ] ].
											self recordMatch: #(166).
											self step.
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
	currentCharacter = $p
		ifTrue: [ 
			self step.
			currentCharacter = $8
				ifTrue: [ 
					self step.
					currentCharacter = $0
						ifTrue: [ 
							self recordMatch: #(126).
							self step ].
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch