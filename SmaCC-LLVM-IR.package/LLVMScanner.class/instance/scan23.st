generated
scan23
	self step.
	currentCharacter = $"
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(256) ] ] repeat ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(256).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(256).
			self step.
			currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
	^ self reportLastMatch