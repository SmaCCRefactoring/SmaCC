generated
scan2
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(173).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(172) ].
			^ self reportLastMatch ] ] repeat