generated
scan1
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(102) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			currentCharacter = $u
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							3
								timesRepeat: [ 
									self step.
									currentCharacter isHexDigit
										ifFalse: [ ^ self reportLastMatch ] ].
							^ self scan1 ].
					^ self reportLastMatch ].
			(('"''' includes: currentCharacter)
				or: [ (currentCharacter between: $0 and: $7) or: [ '\bfnrt' includes: currentCharacter ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ] ] repeat