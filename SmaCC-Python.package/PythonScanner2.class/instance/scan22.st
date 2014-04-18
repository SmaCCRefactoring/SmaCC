generated
scan22
	self recordMatch: #(44).
	self step.
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(58).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	^ self reportLastMatch