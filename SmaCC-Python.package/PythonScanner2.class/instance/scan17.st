generated
scan17
	self recordMatch: #(24).
	self step.
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(28).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	^ self reportLastMatch