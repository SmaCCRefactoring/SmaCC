generated
scan1
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(78) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			^ self scan1 ] ] repeat