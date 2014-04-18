generated
scan23
	self recordMatch: #(79).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan24 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan26 ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(79).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan24 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan26 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan25 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			^ self reportLastMatch ].
	('Bb' includes: currentCharacter)
		ifTrue: [ 
			self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ 
					[ 
					self recordMatch: #(79).
					self step.
					currentCharacter between: $0 and: $1 ] whileTrue.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan25 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	('Oo' includes: currentCharacter)
		ifTrue: [ 
			self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ 
					[ 
					self recordMatch: #(79).
					self step.
					currentCharacter between: $0 and: $7 ] whileTrue.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
			^ self reportLastMatch ].
	('Xx' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(79).
					self step.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(79) ].
					currentCharacter isHexDigit ] whileTrue ] ].
	^ self reportLastMatch