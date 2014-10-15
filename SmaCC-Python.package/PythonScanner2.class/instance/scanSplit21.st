generated
scanSplit21
	self recordMatch: #(66).
	self step.
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(43).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(16) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(45) ].
	currentCharacter = $>
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	^ self reportLastMatch