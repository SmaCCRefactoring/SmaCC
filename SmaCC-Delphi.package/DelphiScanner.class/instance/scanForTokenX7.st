generated
scanForTokenX7
	self step.
	('Oo' includes: currentCharacter)
		ifTrue: [ self step.
			('Pp' includes: currentCharacter)
				ifTrue: [ self step.
					('Ee' includes: currentCharacter)
						ifTrue: [ self step.
							('Rr' includes: currentCharacter)
								ifTrue: [ self step.
									('Aa' includes: currentCharacter)
										ifTrue: [ self step.
											('Tt' includes: currentCharacter)
												ifTrue: [ self step.
													('Oo' includes: currentCharacter)
														ifTrue: [ self step.
															('Rr' includes: currentCharacter)
																ifTrue: [ ^ self recordAndReportMatch: #(89) ] ] ] ] ] ] ] ].
	^ self reportLastMatch