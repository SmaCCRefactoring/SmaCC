generated
scan9
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			2
				timesRepeat: [ 
					self step.
					currentCharacter = $"
						ifFalse: [ ^ self scan9 ] ].
			^ self recordAndReportMatch: #(72) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			^ self scan9 ] ] repeat