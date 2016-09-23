generated
scanForToken
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $<
		ifTrue: [ (self scanForString: '<<')
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			^ self reportLastMatch ].
	currentCharacter == $>
		ifTrue: [ (self scanForString: '>>')
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			^ self reportLastMatch ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter isSeparator
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch