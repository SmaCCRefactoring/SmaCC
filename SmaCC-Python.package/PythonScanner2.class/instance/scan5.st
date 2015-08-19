generated
scan5
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #(72) ] ].
			^ self scan5 ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			^ self scan5 ] ] repeat