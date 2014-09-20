generated
scan3
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(254).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			^ self reportLastMatch ] ] repeat