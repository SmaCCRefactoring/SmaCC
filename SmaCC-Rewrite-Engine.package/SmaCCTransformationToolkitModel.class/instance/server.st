accessing
server
	^(server isNil or: [server isEmpty]) ifTrue: ['localhost'] ifFalse: [server]