generated
scanForToken
	state == #lineBegin
		ifTrue: [ ^ self scan65 ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch