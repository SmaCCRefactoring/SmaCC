generated
scan11
	self recordMatch: #(26).
	self step.
	currentCharacter == $r ifTrue: [^self scan12].
	(currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]])
		ifTrue:
			[[self recordMatch: #(26).
			self step.
			currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue].
	^self reportLastMatch