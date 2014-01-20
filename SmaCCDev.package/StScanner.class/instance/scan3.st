generated-scanner
scan3
	self recordMatch: #(24).
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
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #variableAssignment ].
	^ self reportLastMatch