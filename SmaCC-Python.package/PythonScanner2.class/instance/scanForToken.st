generated
scanForToken
	state == #lineBegin
		ifTrue: [ ^ self scan32 ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch