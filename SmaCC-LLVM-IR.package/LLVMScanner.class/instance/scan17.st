generated
scan17
	self recordMatch: #(252).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			(currentCharacter = $H or: [ currentCharacter between: $K and: $M ])
				ifTrue: [ self step ].
			currentCharacter isHexDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(249).
					self step.
					currentCharacter isHexDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(252).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan11 ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch