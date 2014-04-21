generated
scan16
	[ 
	self step.
	currentCharacter = $'
		ifTrue: [ 
			2
				timesRepeat: [ 
					self step.
					currentCharacter = $'
						ifFalse: [ ^ self scan16 ] ].
			^ self recordAndReportMatch: #(72) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			^ self scan16 ] ] repeat