generated
scan33
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
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	currentCharacter = $>
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	^ self reportLastMatch