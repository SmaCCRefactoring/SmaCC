generated
scan36
	self recordMatch: #(65).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(54) ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(4).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(9) ] ].
	^ self reportLastMatch