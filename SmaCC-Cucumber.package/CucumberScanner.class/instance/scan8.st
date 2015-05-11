generated
scan8
	[ 
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self step.
			currentCharacter = $`
				ifTrue: [ 
					self step.
					currentCharacter = $`
						ifTrue: [ ^ self recordAndReportMatch: #(1) ] ].
			^ self scan8 ] ] repeat