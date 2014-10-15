generated
scanSplit2
	self recordMatch: #(71).
	self step.
	currentCharacter = $l
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $s
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $s
								ifTrue: [ 
									self recordMatch: #(47 71).
									self step.
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
										ifTrue: [ 
											[ 
											self recordMatch: #(71).
											self step.
											(currentCharacter between: $0 and: $9)
												or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
												whileTrue ].
									^ self reportLastMatch ] ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(71).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $b and: $z ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self recordMatch: #(71).
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self recordMatch: #(71).
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self recordMatch: #(71).
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self recordMatch: #(8 71).
															self step.
															((currentCharacter between: $0 and: $9)
																or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
																ifTrue: [ 
																	[ 
																	self recordMatch: #(71).
																	self step.
																	(currentCharacter between: $0 and: $9)
																		or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
																		whileTrue ].
															^ self reportLastMatch ].
													((currentCharacter between: $0 and: $9)
														or: [ 
															(currentCharacter between: $A and: $Z)
																or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
														ifTrue: [ 
															[ 
															self recordMatch: #(71).
															self step.
															(currentCharacter between: $0 and: $9)
																or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
																whileTrue ].
													^ self reportLastMatch ].
											((currentCharacter between: $0 and: $9)
												or: [ 
													(currentCharacter between: $A and: $Z)
														or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $t) or: [ currentCharacter between: $v and: $z ] ] ] ])
												ifTrue: [ 
													[ 
													self recordMatch: #(71).
													self step.
													(currentCharacter between: $0 and: $9)
														or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
														whileTrue ].
											^ self reportLastMatch ].
									((currentCharacter between: $0 and: $9)
										or: [ 
											(currentCharacter between: $A and: $Z)
												or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $m) or: [ currentCharacter between: $o and: $z ] ] ] ])
										ifTrue: [ 
											[ 
											self recordMatch: #(71).
											self step.
											(currentCharacter between: $0 and: $9)
												or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
												whileTrue ].
									^ self reportLastMatch ].
							((currentCharacter between: $0 and: $9)
								or: [ 
									(currentCharacter between: $A and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $h) or: [ currentCharacter between: $j and: $z ] ] ] ])
								ifTrue: [ 
									[ 
									self recordMatch: #(71).
									self step.
									(currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
										whileTrue ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $s) or: [ currentCharacter between: $u and: $z ] ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(71).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $m) or: [ currentCharacter between: $o and: $z ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $k)
								or: [ (currentCharacter between: $m and: $n) or: [ currentCharacter between: $p and: $z ] ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch