generated
scan19
	self recordMatch: #(19).
	self step.
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(20).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	^ self reportLastMatch