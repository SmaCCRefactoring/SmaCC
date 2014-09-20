generated
scan2
	self recordMatch: #(103).
	self step.
	currentCharacter = $"
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(264) ] ] repeat ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(259).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(260).
			self step.
			currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
	^ self reportLastMatch