generated
scan2
	self recordMatch: #(73).
	self step.
	currentCharacter = $"
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(179) ] ] repeat ].
	(currentCharacter isDigit or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #(177).
			self step.
			currentCharacter isDigit or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(178).
			self step.
			currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
	^ self reportLastMatch