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
						ifTrue: [ ^ self recordAndReportMatch: #(72) ].
					^ self scan4 ].
			^ self scan4 ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			^ self scan4 ] ] repeat