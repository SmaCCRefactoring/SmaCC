generated-scanner
scan5
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ 
			currentCharacter = $_
				or: [ 
					(currentCharacter between: $a and: $z)
						or: [ 
							currentCharacter = $ª
								or: [ 
									currentCharacter = $µ
										or: [ 
											currentCharacter = $º
												or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(29).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ 
							currentCharacter = $_
								or: [ 
									(currentCharacter between: $a and: $z)
										or: [ 
											currentCharacter = $ª
												or: [ 
													currentCharacter = $µ
														or: [ 
															currentCharacter = $º
																or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ] ] ]
				whileTrue.
			currentCharacter = $.
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	^ self reportLastMatch