public
onExit
	notifyView notNil ifTrue: [notifyView notifyIcon: nil].
	^super onExit