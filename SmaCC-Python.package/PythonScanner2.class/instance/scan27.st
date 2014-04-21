generated
scan27
	self recordMatch: #(50).
	self step.
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(48).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	^ self reportLastMatch