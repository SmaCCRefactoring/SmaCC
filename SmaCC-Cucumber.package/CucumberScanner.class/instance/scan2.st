generated
scan2
	[ 
	self step.
	currentCharacter = $@
		ifTrue: [ 
			self step.
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter = $A
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ ^ self scan5 ] ].
			^ self reportLastMatch ].
	currentCharacter = $B
		ifTrue: [ 
			self step.
			currentCharacter = $u
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ ^ self scan5 ] ].
			^ self reportLastMatch ].
	currentCharacter = $G
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $v
						ifTrue: [ ^ self scan6 ] ].
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
																ifTrue: [ 
																	self step.
																	currentCharacter = Character space
																		ifTrue: [ 
																			self step.
																			currentCharacter = $O
																				ifTrue: [ 
																					self step.
																					currentCharacter = $u
																						ifTrue: [ 
																							self step.
																							currentCharacter = $t
																								ifTrue: [ 
																									self step.
																									currentCharacter = $l
																										ifTrue: [ 
																											self step.
																											currentCharacter = $i
																												ifTrue: [ 
																													self step.
																													currentCharacter = $n
																														ifTrue: [ 
																															self step.
																															currentCharacter = $e
																																ifTrue: [ 
																																	self step.
																																	currentCharacter = $:
																																		ifTrue: [ ^ self scan1 ] ] ] ] ] ] ] ].
																			^ self reportLastMatch ].
																	currentCharacter = $:
																		ifTrue: [ ^ self scan1 ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	('#|' includes: currentCharacter)
		ifTrue: [ ^ self scan1 ].
	('TW' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter = $h
				ifTrue: [ ^ self scan6 ] ].
	^ self reportLastMatch