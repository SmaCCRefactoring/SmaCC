generated
scan17
	self recordMatch: #(30).
	self step.
	currentCharacter = $r
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $x
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $c
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $l
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $u
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $d
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $s
														ifTrue: [ 
															self recordMatch: #(13 30).
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