generated
scan4
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #(1) ] ].
			^ self scan4 ] ] repeat