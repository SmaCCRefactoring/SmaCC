generated
scanForToken
	state == #interpolatedString
		ifTrue:
			[ ^ self scanForTokenX2 ].
	state == #interpolatedVerbatimString
		ifTrue:
			[ ^ self scanForTokenX1 ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch