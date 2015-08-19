generated
scan8
	[ 
	self step.
	currentCharacter = $'
		ifTrue: [ 
			self step.
			currentCharacter = $'
				ifTrue: [ 
					self step.
					currentCharacter = $'
						ifTrue: [ ^ self recordAndReportMatch: #(72) ] ].
			^ self scan8 ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			^ self scan8 ] ] repeat