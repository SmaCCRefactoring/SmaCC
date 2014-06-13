generated
scan31
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self recordAndReportMatch: #(38) ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ 
					3
						timesRepeat: [ 
							self recordMatch: #(38).
							self step.
							currentCharacter isHexDigit
								ifFalse: [ ^ self reportLastMatch ] ].
					^ self recordAndReportMatch: #(38) ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(38)