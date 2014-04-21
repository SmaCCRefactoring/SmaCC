generated
scan5
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			2
				timesRepeat: [ 
					self step.
					currentCharacter = $"
						ifFalse: [ ^ self scan5 ] ].
			^ self recordAndReportMatch: #(72) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			^ self scan5 ] ] repeat