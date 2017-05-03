actions
setServer
	| server |
	server := UITheme builder textEntry: 'Enter server name:' title: 'Server' entryText: self model server.
	server isNil
		ifTrue: [ ^ self ].
	self model server: server