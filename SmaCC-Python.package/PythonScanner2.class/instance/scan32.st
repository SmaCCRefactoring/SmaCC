generated
scan32
	self recordMatch: #(73).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(69) ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(4).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(6) ] ].
	^ self reportLastMatch