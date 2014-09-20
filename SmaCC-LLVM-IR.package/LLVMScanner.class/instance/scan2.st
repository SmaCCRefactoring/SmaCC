generated
scan2
	self recordMatch: #(103).
	self step.
	currentCharacter = $"
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(255) ] ] repeat ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(253).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(254).
			self step.
			currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
	^ self reportLastMatch