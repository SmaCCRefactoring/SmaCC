generated
scan20
	[ 
	self step.
	currentCharacter = $#
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $B
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $k
								ifTrue: [ 
									self step.
									currentCharacter = $g
										ifTrue: [ 
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self step.
													currentCharacter = $o
														ifTrue: [ 
															self step.
															currentCharacter = $u
																ifTrue: [ 
																	self step.
																	currentCharacter = $n
																		ifTrue: [ 
																			self step.
																			currentCharacter = $d
																				ifTrue: [ ^ self scan28 ] ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $S
		ifTrue: [ 
			self step.
			currentCharacter = $c
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $n
								ifTrue: [ 
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self step.
													currentCharacter = $i
														ifTrue: [ 
															self step.
															currentCharacter = $o
																ifTrue: [ ^ self scan28 ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self reportLastMatch