generated-scanner
scan1
	[ 
	self step.
	currentCharacter ~= $* ] whileTrue.
	currentCharacter = $*
		ifTrue: [ 
			[ 
			self step.
			(currentCharacter <= $) or: [ (currentCharacter between: $+ and: $.) or: [ currentCharacter >= $0 ] ])
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $* ] whileTrue.
			currentCharacter = $/
				ifTrue: [ ^ self recordAndReportMatch: #comment ].
			^ self reportLastMatch ].
	^ self reportLastMatch