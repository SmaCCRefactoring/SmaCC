generated
scanForToken
	state == #lineBegin
		ifTrue: [ ^ self scan66 ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch