generated
scanSplitSeq7
	currentCharacter = $h
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $c
														ifTrue: [ 
															self recordMatch: #(30).
															self step.
															currentCharacter = $h
																ifTrue: [ 
																	self recordMatch: #(30).
																	self step.
																	currentCharacter = $y
																		ifTrue: [ 
																			self recordMatch: #(15 30).
																			self step ] ] ] ] ] ] ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ ^ self scanSplit2 ].
	currentCharacter = $l
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $f
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self recordMatch: #(19 30).
									self step ] ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ 
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
									2
										timesRepeat: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $s
												ifFalse: [ ^ self reportLastMatch ] ].
									self recordMatch: #(30).
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $c
												ifTrue: [ 
													self recordMatch: #(21 30).
													self step ] ] ] ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	^ self scanSplitSeq6