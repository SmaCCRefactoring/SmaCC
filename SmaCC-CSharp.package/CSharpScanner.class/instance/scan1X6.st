generated
scan1X6
	self recordMatch: #(153).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(154).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(123) ] ].
	^ self reportLastMatch