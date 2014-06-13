generated
scan22
	self recordMatch: #(30).
	self step.
	currentCharacter = $o
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $s
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $s
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $o
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $c
														ifTrue: [ 
															self recordMatch: #(21 30).
															self step ].
													(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
														ifTrue: [ 
															[ 
															self recordMatch: #(30).
															self step.
															currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
													^ self reportLastMatch ] ].
									(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
										ifTrue: [ 
											[ 
											self recordMatch: #(30).
											self step.
											currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
									^ self reportLastMatch ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(30).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ] ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch