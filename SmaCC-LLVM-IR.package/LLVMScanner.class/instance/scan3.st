generated
scan3
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(174).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(173) ].
			^ self reportLastMatch ] ] repeat