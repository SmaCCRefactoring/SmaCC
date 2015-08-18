generated
scan17
	[ 
	self step.
	currentCharacter = $*
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $* ] whileTrue.
			currentCharacter = $/
				ifTrue: [ ^ self recordAndReportMatch: #(80) ].
			^ self scan17 ] ] repeat