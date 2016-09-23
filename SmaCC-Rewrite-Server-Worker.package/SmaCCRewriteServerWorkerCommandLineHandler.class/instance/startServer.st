public
startServer
	[ 
	| worker |
	worker := SmaCCRewriteServerWorker new.
	self arguments
		do:
			[ :each | 
			(each beginsWith: 'remote=')
				ifTrue: [ worker remotePrefix: (each copyFrom: 8 to: each size) ].
			(each beginsWith: 'local=')
				ifTrue: [ worker localPrefix: (each copyFrom: 7 to: each size) ] ].
	worker startConnectingTo: self server onPort: self port ]
		on: Error
		do: [ :ex | self stderr nextPutAll: ex messageText ]