generated-scanner
scan3
	[ 
	self step.
	currentCharacter ~= $* ] whileTrue.
	currentCharacter = $*
		ifTrue: [ 
			[ 
			self step.
			(currentCharacter <= $) or: [ (currentCharacter between: $+ and: $.) or: [ currentCharacter >= $0 ] ])
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $* ] whileTrue.
			currentCharacter = $/
				ifTrue: [ ^ self recordAndReportMatch: #comment ].
			^ self reportLastMatch ].
	^ self reportLastMatch