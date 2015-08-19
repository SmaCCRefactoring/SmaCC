generated
scan9
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
			^ self scan9 ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			^ self scan9 ] ] repeat