generated
scan8
	[ 
	self step.
	currentCharacter = $*
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $* ] whileTrue.
			currentCharacter = $/
				ifTrue: [ ^ self recordAndReportMatch: #(32) ].
			^ self scan8 ] ] repeat