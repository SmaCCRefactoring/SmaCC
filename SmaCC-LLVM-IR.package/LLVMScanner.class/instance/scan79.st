generated
scan79
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(170) ].
			currentCharacter = $_
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(170) ].
					currentCharacter = $f
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(170) ].
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
															self recordMatch: #(40).
															self step ].
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(170) ].
													(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
														ifTrue: [ ^ self scan4 ].
													^ self reportLastMatch ] ].
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(170) ].
									(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
										ifTrue: [ ^ self scan4 ].
									^ self reportLastMatch ] ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan4 ].
					^ self reportLastMatch ] ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch