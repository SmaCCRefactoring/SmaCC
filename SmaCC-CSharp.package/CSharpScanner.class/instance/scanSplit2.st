generated
scanSplit2
	self recordMatch: #(155 156).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan8 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Xx' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(155).
					self step.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self scan10 ].
					('Uu' includes: currentCharacter)
						ifTrue: [ ^ self scan11 ].
					currentCharacter isHexDigit ] whileTrue ].
			^ self reportLastMatch ].
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(156) ].
	^ self reportLastMatch