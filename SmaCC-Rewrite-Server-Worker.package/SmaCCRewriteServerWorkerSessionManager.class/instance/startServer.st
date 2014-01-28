public
startServer
	[| worker |
	worker := SmaCCRewriteServerWorker new.
	self cmdLineFlags
		do:
			[:each | 
			(each beginsWith: 'remote=') ifTrue: [worker remotePrefix: (each copyFrom: 8)].
			(each beginsWith: 'local=') ifTrue: [worker localPrefix: (each copyFrom: 7)]].
	worker startConnectingTo: self server onPort: self port] on: Error do: [:ex | self logError: ex]