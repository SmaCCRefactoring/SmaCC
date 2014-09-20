generated
scan16
	self step.
	currentCharacter = $"
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(251) ] ] repeat ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(251).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(251).
			self step.
			currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
	^ self reportLastMatch