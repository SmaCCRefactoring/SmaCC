generated
scan17
	self recordMatch: #(253).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			(currentCharacter = $H or: [ currentCharacter between: $K and: $M ])
				ifTrue: [ self step ].
			currentCharacter isHexDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(250).
					self step.
					currentCharacter isHexDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(253).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan11 ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch