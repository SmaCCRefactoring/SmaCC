generated
scan30
	self recordMatch: #(76).
	self step.
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(43).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(70) ].
	currentCharacter = $>
		ifTrue: [ ^ self recordAndReportMatch: #(63) ].
	^ self reportLastMatch