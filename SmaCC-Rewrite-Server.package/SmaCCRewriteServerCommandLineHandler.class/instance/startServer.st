activation
startServer
	[ SmaCCServer startOn: self port ]
		on: Error
		do: [ :ex | self stderr nextPutAll: ex messageText ]